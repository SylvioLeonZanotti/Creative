(function(){const t=document.createElement("link").relList;if(t&&t.supports&&t.supports("modulepreload"))return;for(const i of document.querySelectorAll('link[rel="modulepreload"]'))r(i);new MutationObserver(i=>{for(const o of i)if(o.type==="childList")for(const s of o.addedNodes)s.tagName==="LINK"&&s.rel==="modulepreload"&&r(s)}).observe(document,{childList:!0,subtree:!0});function n(i){const o={};return i.integrity&&(o.integrity=i.integrity),i.referrerpolicy&&(o.referrerPolicy=i.referrerpolicy),i.crossorigin==="use-credentials"?o.credentials="include":i.crossorigin==="anonymous"?o.credentials="omit":o.credentials="same-origin",o}function r(i){if(i.ep)return;i.ep=!0;const o=n(i);fetch(i.href,o)}})();function U(){}const Ae=e=>e;function Re(e){return e()}function we(){return Object.create(null)}function F(e){e.forEach(Re)}function de(e){return typeof e=="function"}function Ue(e,t){return e!=e?t==t:e!==t||e&&typeof e=="object"||typeof e=="function"}function Ge(e){return Object.keys(e).length===0}const Pe=typeof window<"u";let Je=Pe?()=>window.performance.now():()=>Date.now(),pe=Pe?e=>requestAnimationFrame(e):U;const I=new Set;function Ve(e){I.forEach(t=>{t.c(e)||(I.delete(t),t.f())}),I.size!==0&&pe(Ve)}function Qe(e){let t;return I.size===0&&pe(Ve),{promise:new Promise(n=>{I.add(t={c:e,f:n})}),abort(){I.delete(t)}}}function u(e,t){e.appendChild(t)}function He(e){if(!e)return document;const t=e.getRootNode?e.getRootNode():e.ownerDocument;return t&&t.host?t:e.ownerDocument}function Xe(e){const t=g("style");return Ye(He(e),t),t.sheet}function Ye(e,t){return u(e.head||e,t),t.sheet}function Te(e,t,n){e.insertBefore(t,n||null)}function ie(e){e.parentNode.removeChild(e)}function g(e){return document.createElement(e)}function D(e){return document.createElementNS("http://www.w3.org/2000/svg",e)}function N(e){return document.createTextNode(e)}function P(){return N(" ")}function Ze(){return N("")}function f(e,t,n){n==null?e.removeAttribute(t):e.getAttribute(t)!==n&&e.setAttribute(t,n)}function et(e){return Array.from(e.childNodes)}function fe(e,t){t=""+t,e.wholeText!==t&&(e.data=t)}function xe(e,t,n,r){n===null?e.style.removeProperty(t):e.style.setProperty(t,n,r?"important":"")}function tt(e,t,{bubbles:n=!1,cancelable:r=!1}={}){const i=document.createEvent("CustomEvent");return i.initCustomEvent(e,n,r,t),i}const ne=new Map;let re=0;function nt(e){let t=5381,n=e.length;for(;n--;)t=(t<<5)-t^e.charCodeAt(n);return t>>>0}function rt(e,t){const n={stylesheet:Xe(t),rules:{}};return ne.set(e,n),n}function Le(e,t,n,r,i,o,s,l=0){const p=16.666/r;let c=`{
`;for(let x=0;x<=1;x+=p){const C=t+(n-t)*o(x);c+=x*100+`%{${s(C,1-C)}}
`}const m=c+`100% {${s(n,1-n)}}
}`,h=`__svelte_${nt(m)}_${l}`,d=He(e),{stylesheet:v,rules:_}=ne.get(d)||rt(d,e);_[h]||(_[h]=!0,v.insertRule(`@keyframes ${h} ${m}`,v.cssRules.length));const w=e.style.animation||"";return e.style.animation=`${w?`${w}, `:""}${h} ${r}ms linear ${i}ms 1 both`,re+=1,h}function it(e,t){const n=(e.style.animation||"").split(", "),r=n.filter(t?o=>o.indexOf(t)<0:o=>o.indexOf("__svelte")===-1),i=n.length-r.length;i&&(e.style.animation=r.join(", "),re-=i,re||st())}function st(){pe(()=>{re||(ne.forEach(e=>{const{ownerNode:t}=e.stylesheet;t&&ie(t)}),ne.clear())})}let G;function q(e){G=e}function ot(){if(!G)throw new Error("Function called outside component initialization");return G}function ft(e){ot().$$.on_destroy.push(e)}const z=[],be=[],Y=[],Ce=[],lt=Promise.resolve();let ce=!1;function ut(){ce||(ce=!0,lt.then(Ie))}function J(e){Y.push(e)}const le=new Set;let X=0;function Ie(){const e=G;do{for(;X<z.length;){const t=z[X];X++,q(t),ct(t.$$)}for(q(null),z.length=0,X=0;be.length;)be.pop()();for(let t=0;t<Y.length;t+=1){const n=Y[t];le.has(n)||(le.add(n),n())}Y.length=0}while(z.length);for(;Ce.length;)Ce.pop()();ce=!1,le.clear(),q(e)}function ct(e){if(e.fragment!==null){e.update(),F(e.before_update);const t=e.dirty;e.dirty=[-1],e.fragment&&e.fragment.p(e.ctx,t),e.after_update.forEach(J)}}let W;function at(){return W||(W=Promise.resolve(),W.then(()=>{W=null})),W}function ue(e,t,n){e.dispatchEvent(tt(`${t?"intro":"outro"}${n}`))}const Z=new Set;let E;function dt(){E={r:0,c:[],p:E}}function pt(){E.r||F(E.c),E=E.p}function ee(e,t){e&&e.i&&(Z.delete(e),e.i(t))}function Ee(e,t,n,r){if(e&&e.o){if(Z.has(e))return;Z.add(e),E.c.push(()=>{Z.delete(e),r&&(n&&e.d(1),r())}),e.o(t)}else r&&r()}const ht={duration:0};function $e(e,t,n,r){let i=t(e,n),o=r?0:1,s=null,l=null,p=null;function c(){p&&it(e,p)}function m(d,v){const _=d.b-o;return v*=Math.abs(_),{a:o,b:d.b,d:_,duration:v,start:d.start,end:d.start+v,group:d.group}}function h(d){const{delay:v=0,duration:_=300,easing:w=Ae,tick:x=U,css:C}=i||ht,$={start:Je()+v,b:d};d||($.group=E,E.r+=1),s||l?l=$:(C&&(c(),p=Le(e,o,d,_,v,w,C)),d&&x(0,1),s=m($,_),J(()=>ue(e,d,"start")),Qe(b=>{if(l&&b>l.start&&(s=m(l,_),l=null,ue(e,s.b,"start"),C&&(c(),p=Le(e,o,s.b,s.duration,0,w,i.css))),s){if(b>=s.end)x(o=s.b,1-o),ue(e,s.b,"end"),l||(s.b?c():--s.group.r||F(s.group.c)),s=null;else if(b>=s.start){const B=b-s.start;o=s.a+s.d*w(B/s.duration),x(o,1-o)}}return!!(s||l)}))}return{run(d){de(i)?at().then(()=>{i=i(),h(d)}):h(d)},end(){c(),s=l=null}}}function mt(e,t,n,r){const{fragment:i,after_update:o}=e.$$;i&&i.m(t,n),r||J(()=>{const s=e.$$.on_mount.map(Re).filter(de);e.$$.on_destroy?e.$$.on_destroy.push(...s):F(s),e.$$.on_mount=[]}),o.forEach(J)}function vt(e,t){const n=e.$$;n.fragment!==null&&(F(n.on_destroy),n.fragment&&n.fragment.d(t),n.on_destroy=n.fragment=null,n.ctx=[])}function gt(e,t){e.$$.dirty[0]===-1&&(z.push(e),ut(),e.$$.dirty.fill(0)),e.$$.dirty[t/31|0]|=1<<t%31}function _t(e,t,n,r,i,o,s,l=[-1]){const p=G;q(e);const c=e.$$={fragment:null,ctx:[],props:o,update:U,not_equal:i,bound:we(),on_mount:[],on_destroy:[],on_disconnect:[],before_update:[],after_update:[],context:new Map(t.context||(p?p.$$.context:[])),callbacks:we(),dirty:l,skip_bound:!1,root:t.target||p.$$.root};s&&s(c.root);let m=!1;if(c.ctx=n?n(e,t.props||{},(h,d,...v)=>{const _=v.length?v[0]:d;return c.ctx&&i(c.ctx[h],c.ctx[h]=_)&&(!c.skip_bound&&c.bound[h]&&c.bound[h](_),m&&gt(e,h)),d}):[],c.update(),m=!0,F(c.before_update),c.fragment=r?r(c.ctx):!1,t.target){if(t.hydrate){const h=et(t.target);c.fragment&&c.fragment.l(h),h.forEach(ie)}else c.fragment&&c.fragment.c();t.intro&&ee(e.$$.fragment),mt(e,t.target,t.anchor,t.customElement),Ie()}q(p)}class yt{$destroy(){vt(this,1),this.$destroy=U}$on(t,n){if(!de(n))return U;const r=this.$$.callbacks[t]||(this.$$.callbacks[t]=[]);return r.push(n),()=>{const i=r.indexOf(n);i!==-1&&r.splice(i,1)}}$set(t){this.$$set&&!Ge(t)&&(this.$$.skip_bound=!0,this.$$set(t),this.$$.skip_bound=!1)}}function ke(e,{delay:t=0,duration:n=400,easing:r=Ae}={}){const i=+getComputedStyle(e).opacity;return{delay:t,duration:n,easing:r,css:o=>`opacity: ${o*i}`}}var he={exports:{}},S=typeof Reflect=="object"?Reflect:null,Oe=S&&typeof S.apply=="function"?S.apply:function(t,n,r){return Function.prototype.apply.call(t,n,r)},te;S&&typeof S.ownKeys=="function"?te=S.ownKeys:Object.getOwnPropertySymbols?te=function(t){return Object.getOwnPropertyNames(t).concat(Object.getOwnPropertySymbols(t))}:te=function(t){return Object.getOwnPropertyNames(t)};function wt(e){console&&console.warn&&console.warn(e)}var Se=Number.isNaN||function(t){return t!==t};function a(){a.init.call(this)}he.exports=a;he.exports.once=Ct;a.EventEmitter=a;a.prototype._events=void 0;a.prototype._eventsCount=0;a.prototype._maxListeners=void 0;var Me=10;function se(e){if(typeof e!="function")throw new TypeError('The "listener" argument must be of type Function. Received type '+typeof e)}Object.defineProperty(a,"defaultMaxListeners",{enumerable:!0,get:function(){return Me},set:function(e){if(typeof e!="number"||e<0||Se(e))throw new RangeError('The value of "defaultMaxListeners" is out of range. It must be a non-negative number. Received '+e+".");Me=e}});a.init=function(){(this._events===void 0||this._events===Object.getPrototypeOf(this)._events)&&(this._events=Object.create(null),this._eventsCount=0),this._maxListeners=this._maxListeners||void 0};a.prototype.setMaxListeners=function(t){if(typeof t!="number"||t<0||Se(t))throw new RangeError('The value of "n" is out of range. It must be a non-negative number. Received '+t+".");return this._maxListeners=t,this};function Fe(e){return e._maxListeners===void 0?a.defaultMaxListeners:e._maxListeners}a.prototype.getMaxListeners=function(){return Fe(this)};a.prototype.emit=function(t){for(var n=[],r=1;r<arguments.length;r++)n.push(arguments[r]);var i=t==="error",o=this._events;if(o!==void 0)i=i&&o.error===void 0;else if(!i)return!1;if(i){var s;if(n.length>0&&(s=n[0]),s instanceof Error)throw s;var l=new Error("Unhandled error."+(s?" ("+s.message+")":""));throw l.context=s,l}var p=o[t];if(p===void 0)return!1;if(typeof p=="function")Oe(p,this,n);else for(var c=p.length,m=ze(p,c),r=0;r<c;++r)Oe(m[r],this,n);return!0};function Be(e,t,n,r){var i,o,s;if(se(n),o=e._events,o===void 0?(o=e._events=Object.create(null),e._eventsCount=0):(o.newListener!==void 0&&(e.emit("newListener",t,n.listener?n.listener:n),o=e._events),s=o[t]),s===void 0)s=o[t]=n,++e._eventsCount;else if(typeof s=="function"?s=o[t]=r?[n,s]:[s,n]:r?s.unshift(n):s.push(n),i=Fe(e),i>0&&s.length>i&&!s.warned){s.warned=!0;var l=new Error("Possible EventEmitter memory leak detected. "+s.length+" "+String(t)+" listeners added. Use emitter.setMaxListeners() to increase limit");l.name="MaxListenersExceededWarning",l.emitter=e,l.type=t,l.count=s.length,wt(l)}return e}a.prototype.addListener=function(t,n){return Be(this,t,n,!1)};a.prototype.on=a.prototype.addListener;a.prototype.prependListener=function(t,n){return Be(this,t,n,!0)};function xt(){if(!this.fired)return this.target.removeListener(this.type,this.wrapFn),this.fired=!0,arguments.length===0?this.listener.call(this.target):this.listener.apply(this.target,arguments)}function Ke(e,t,n){var r={fired:!1,wrapFn:void 0,target:e,type:t,listener:n},i=xt.bind(r);return i.listener=n,r.wrapFn=i,i}a.prototype.once=function(t,n){return se(n),this.on(t,Ke(this,t,n)),this};a.prototype.prependOnceListener=function(t,n){return se(n),this.prependListener(t,Ke(this,t,n)),this};a.prototype.removeListener=function(t,n){var r,i,o,s,l;if(se(n),i=this._events,i===void 0)return this;if(r=i[t],r===void 0)return this;if(r===n||r.listener===n)--this._eventsCount===0?this._events=Object.create(null):(delete i[t],i.removeListener&&this.emit("removeListener",t,r.listener||n));else if(typeof r!="function"){for(o=-1,s=r.length-1;s>=0;s--)if(r[s]===n||r[s].listener===n){l=r[s].listener,o=s;break}if(o<0)return this;o===0?r.shift():Lt(r,o),r.length===1&&(i[t]=r[0]),i.removeListener!==void 0&&this.emit("removeListener",t,l||n)}return this};a.prototype.off=a.prototype.removeListener;a.prototype.removeAllListeners=function(t){var n,r,i;if(r=this._events,r===void 0)return this;if(r.removeListener===void 0)return arguments.length===0?(this._events=Object.create(null),this._eventsCount=0):r[t]!==void 0&&(--this._eventsCount===0?this._events=Object.create(null):delete r[t]),this;if(arguments.length===0){var o=Object.keys(r),s;for(i=0;i<o.length;++i)s=o[i],s!=="removeListener"&&this.removeAllListeners(s);return this.removeAllListeners("removeListener"),this._events=Object.create(null),this._eventsCount=0,this}if(n=r[t],typeof n=="function")this.removeListener(t,n);else if(n!==void 0)for(i=n.length-1;i>=0;i--)this.removeListener(t,n[i]);return this};function De(e,t,n){var r=e._events;if(r===void 0)return[];var i=r[t];return i===void 0?[]:typeof i=="function"?n?[i.listener||i]:[i]:n?bt(i):ze(i,i.length)}a.prototype.listeners=function(t){return De(this,t,!0)};a.prototype.rawListeners=function(t){return De(this,t,!1)};a.listenerCount=function(e,t){return typeof e.listenerCount=="function"?e.listenerCount(t):We.call(e,t)};a.prototype.listenerCount=We;function We(e){var t=this._events;if(t!==void 0){var n=t[e];if(typeof n=="function")return 1;if(n!==void 0)return n.length}return 0}a.prototype.eventNames=function(){return this._eventsCount>0?te(this._events):[]};function ze(e,t){for(var n=new Array(t),r=0;r<t;++r)n[r]=e[r];return n}function Lt(e,t){for(;t+1<e.length;t++)e[t]=e[t+1];e.pop()}function bt(e){for(var t=new Array(e.length),n=0;n<t.length;++n)t[n]=e[n].listener||e[n];return t}function Ct(e,t){return new Promise(function(n,r){function i(s){e.removeListener(t,o),r(s)}function o(){typeof e.removeListener=="function"&&e.removeListener("error",i),n([].slice.call(arguments))}qe(e,t,o,{once:!0}),t!=="error"&&Et(e,i,{once:!0})})}function Et(e,t,n){typeof e.on=="function"&&qe(e,"error",t,n)}function qe(e,t,n,r){if(typeof e.on=="function")r.once?e.once(t,n):e.on(t,n);else if(typeof e.addEventListener=="function")e.addEventListener(t,function i(o){r.once&&e.removeEventListener(t,i),n(o)});else throw new TypeError('The "emitter" argument must be of type EventEmitter. Received type '+typeof e)}const ae=new he.exports.EventEmitter;window.addEventListener("message",e=>ae.emit(e.data.name,e.data.payload));function je(e,t){ae.on(e,t),ft(()=>ae.removeListener(e,t))}function Ne(e){let t,n,r,i,o,s,l,p,c,m,h,d=parseInt(e[1])+"",v,_,w,x,C,$,b,B,me,ve,V,k,O,y,ge,H,A,R,_e,K,Q=parseInt(e[0])+"",oe,ye,M,j;return{c(){t=g("div"),n=g("div"),r=g("hr"),i=P(),o=g("div"),s=g("div"),l=g("div"),l.innerHTML=`<svg class="w-[1.1875rem] h-[1.5rem]" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M18 6V13C18 13.3978 17.842 13.7794 17.5607 14.0607C17.2794 14.342 16.8978 14.5 16.5 14.5C16.1022 14.5 15.7206 14.342 15.4393 14.0607C15.158 13.7794 15 13.3978 15 13V10C15 9.46957 14.7893 8.96086 14.4142 8.58579C14.0391 8.21071 13.5304 8 13 8H2M18 6L15 3M18 6H17C16.7348 6 16.4804 5.89464 16.2929 5.70711C16.1054 5.51957 16 5.26522 16 5V4M2 17V3C2 2.46957 2.21071 1.96086 2.58579 1.58579C2.96086 1.21071 3.46957 1 4 1H10C10.5304 1 11.0391 1.21071 11.4142 1.58579C11.7893 1.96086 12 2.46957 12 3V17M1 17H13" stroke="white" stroke-opacity="0.5" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"></path></svg> 
            <span class="text-xl text-white/50 font-normal">Valor</span>`,p=P(),c=g("div"),m=g("span"),h=N("$"),v=N(d),_=P(),w=g("div"),x=g("div"),x.innerHTML=`<svg class="w-[1.1875rem] h-[1.5rem]" viewBox="0 0 19 18" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M18 6V13C18 13.3978 17.842 13.7794 17.5607 14.0607C17.2794 14.342 16.8978 14.5 16.5 14.5C16.1022 14.5 15.7206 14.342 15.4393 14.0607C15.158 13.7794 15 13.3978 15 13V10C15 9.46957 14.7893 8.96086 14.4142 8.58579C14.0391 8.21071 13.5304 8 13 8H2M18 6L15 3M18 6H17C16.7348 6 16.4804 5.89464 16.2929 5.70711C16.1054 5.51957 16 5.26522 16 5V4M2 17V3C2 2.46957 2.21071 1.96086 2.58579 1.58579C2.96086 1.21071 3.46957 1 4 1H10C10.5304 1 11.0391 1.21071 11.4142 1.58579C11.7893 1.96086 12 2.46957 12 3V17M1 17H13" stroke="white" stroke-opacity="0.5" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"></path></svg> 
            <span class="text-xl text-white/50 font-normal">Litro</span>`,C=P(),$=g("div"),b=g("span"),B=N(e[2]),me=N("L"),ve=P(),V=g("div"),k=D("svg"),O=D("circle"),y=D("circle"),ge=P(),H=g("div"),A=D("svg"),R=D("path"),_e=P(),K=g("span"),oe=N(Q),ye=N("%"),f(r,"class","h-[8.75rem] border-l-2 border-cr/30 rounded-lg"),f(l,"class","flex flex-row items-center gap-5"),f(m,"class","text-center text-white/50"),f(c,"class","w-14 py-1 px-2 grid place-items-center bg-[#00E4F2]/20 rounded"),f(s,"class","w-[22.4375rem] h-[4.375rem] px-[1.875rem] flex flex-row items-center justify-between bg-black/50 rounded"),f(x,"class","flex flex-row items-center gap-5"),f(b,"class","text-center text-white/50"),f($,"class","w-14 py-1 px-2 grid place-items-center bg-[#F2AE00]/20 rounded"),f(w,"class","w-[22.4375rem] h-[4.375rem] px-[1.875rem] flex flex-row items-center justify-between bg-black/50 rounded"),f(o,"class","flex flex-col items-center gap-[0.375rem]"),f(O,"cx","51"),f(O,"cy","51"),f(O,"r","48"),f(O,"stroke","white"),f(O,"stroke-opacity","0.2"),f(O,"stroke-width","5"),xe(y,"stroke-dashoffset",100-e[0]),f(y,"cx","51"),f(y,"cy","51"),f(y,"r","48"),f(y,"stroke","#6425d9"),f(y,"stroke-width","5"),f(y,"stroke-dasharray","100"),f(y,"stroke-dashoffset","100"),f(y,"stroke-linecap","round"),f(y,"stroke-linejoin","round"),f(y,"pathLength","100"),f(k,"class","w-[6.375rem] h-[6.375rem] -rotate-90"),f(k,"viewBox","0 0 102 102"),f(k,"fill","none"),f(k,"xmlns","http://www.w3.org/2000/svg"),f(R,"d","M17.8846 6.38464V13.3846C17.8846 13.7825 17.7265 14.164 17.4452 14.4453C17.1639 14.7266 16.7824 14.8846 16.3846 14.8846C15.9868 14.8846 15.6052 14.7266 15.3239 14.4453C15.0426 14.164 14.8846 13.7825 14.8846 13.3846V10.3846C14.8846 9.85421 14.6739 9.3455 14.2988 8.97043C13.9237 8.59536 13.415 8.38464 12.8846 8.38464H1.88458M17.8846 6.38464L14.8846 3.38464M17.8846 6.38464H16.8846C16.6194 6.38464 16.365 6.27929 16.1775 6.09175C15.9899 5.90421 15.8846 5.64986 15.8846 5.38464V4.38464M1.88458 17.3846V3.38464C1.88458 2.85421 2.0953 2.3455 2.47037 1.97043C2.84544 1.59536 3.35415 1.38464 3.88458 1.38464H9.88458C10.415 1.38464 10.9237 1.59536 11.2988 1.97043C11.6739 2.3455 11.8846 2.85421 11.8846 3.38464V17.3846M0.884583 17.3846H12.8846"),f(R,"stroke","white"),f(R,"stroke-width","1.4"),f(R,"stroke-linecap","round"),f(R,"stroke-linejoin","round"),f(A,"class","w-[1.1875rem] h-[1.1875rem]"),f(A,"viewBox","0 0 19 19"),f(A,"fill","none"),f(A,"xmlns","http://www.w3.org/2000/svg"),f(K,"class","w-7 text-sm font-semibold"),f(H,"class","absolute flex flex-row items-center gap-[0.4375rem]"),f(V,"class","fixed inset-x-0 grid place-items-center"),f(n,"class","relative bottom-32 left-20 flex flex-row items-center gap-11"),f(t,"class","fixed inset-0 grid items-end justify-start font-poppins text-white "+(location.port==="5173"&&"bg-black/50")+" bg-[url('./assets/bg_cr.png')] bg-no-repeat bg-center bg-cover select-none")},m(L,T){Te(L,t,T),u(t,n),u(n,r),u(n,i),u(n,o),u(o,s),u(s,l),u(s,p),u(s,c),u(c,m),u(m,h),u(m,v),u(o,_),u(o,w),u(w,x),u(w,C),u(w,$),u($,b),u(b,B),u(b,me),u(n,ve),u(n,V),u(V,k),u(k,O),u(k,y),u(V,ge),u(V,H),u(H,A),u(A,R),u(H,_e),u(H,K),u(K,oe),u(K,ye),j=!0},p(L,T){(!j||T&2)&&d!==(d=parseInt(L[1])+"")&&fe(v,d),(!j||T&4)&&fe(B,L[2]),(!j||T&1)&&xe(y,"stroke-dashoffset",100-L[0]),(!j||T&1)&&Q!==(Q=parseInt(L[0])+"")&&fe(oe,Q)},i(L){j||(J(()=>{M||(M=$e(t,ke,{},!0)),M.run(1)}),j=!0)},o(L){M||(M=$e(t,ke,{},!1)),M.run(0),j=!1},d(L){L&&ie(t),L&&M&&M.end()}}}function $t(e){let t,n,r=e[3]&&Ne(e);return{c(){r&&r.c(),t=Ze()},m(i,o){r&&r.m(i,o),Te(i,t,o),n=!0},p(i,[o]){i[3]?r?(r.p(i,o),o&8&&ee(r,1)):(r=Ne(i),r.c(),ee(r,1),r.m(t.parentNode,t)):r&&(dt(),Ee(r,1,1,()=>{r=null}),pt())},i(i){n||(ee(r),n=!0)},o(i){Ee(r),n=!1},d(i){r&&r.d(i),i&&ie(t)}}}function kt(e,t,n){let[r,i,o]=[0,0,0],s=location.port==="5173"||!1;return je("Show",l=>n(3,s=l)),je("Tank",l=>{n(0,r=l==null?void 0:l.tank),n(1,i=l==null?void 0:l.price),n(2,o=l==null?void 0:l.lts)}),[r,i,o,s]}class Ot extends yt{constructor(t){super(),_t(this,t,kt,$t,Ue,{})}}new Ot({target:document.getElementById("app")});
