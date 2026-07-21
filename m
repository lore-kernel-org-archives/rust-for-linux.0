Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D24544D6B4
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627848; cv=none; b=No8Gx1fXE/1A3iWG87DUDSuQgJ/0tZN+WZcDI1R/1jE6IJe0FvqgcM8v8pEUn9UfW8Bb4tU4GPMFhcfDeZLu3pB74NhUE64hpikp2PZQyXz5NzufWDVqijLiCyhiphopOIU/cu6hHymYpYM4ZMbLlCs0TT/D19kYCBactm2yveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627848; c=relaxed/simple;
	bh=jFCAyegiqNPs5PDzpbgVqUPQ7SISnv5jdxzBzrPwdoo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RPfcvJh/LOWum3QxNo88C3hFFSQPHClxahEVPVuCuNFNKRcUVkFW+f4+8yNMjww6ULatzG95osF0AeRFnquE0dU2yr1egUOmjrlfSP1reQ9kFaX0TFL1yAQnjLzhccMs5fIsxbvEtvsQZSW+vTuzVug9C8CAsLPvJvpeIsDTxKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Ir43/mDS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pWsiatfF; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Ir43/mDS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pWsiatfF"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 4AB5C13803DA;
	Tue, 21 Jul 2026 05:57:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 21 Jul 2026 05:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784627845;
	 x=1784631445; bh=jFCAyegiqNPs5PDzpbgVqUPQ7SISnv5jdxzBzrPwdoo=; b=
	Ir43/mDS7WJN/g+KUuI21Q3REmM0YESkWv72eboU1MCYgR+XrJTZBRhe0RV+xT10
	sILlOYiYrS35jmshJoLOeTD8XEtuHwAblISHGShZD5s7800sF2HIv8ObefZkn/0p
	aCdacYeNyOaXqm6n6tqOdV1ECaYSqB6Z0iHG0DPxZXgV4dKEnKnqcxow4NU8M7tv
	0wZWj2IhjVc5kgbW9iMmE5lPt3zLSnF3+tWTIIhDagKGzAyxGyeM0dIIbcf36SDt
	ZxTllQwkbgJt1WWvTRVx157Xpc9mdBXA2VGGK6SeYrn/iOQbnseFw8glQPyUp5Uj
	pb0kIPnjT46lVgl8TmOU3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784627845; x=
	1784631445; bh=jFCAyegiqNPs5PDzpbgVqUPQ7SISnv5jdxzBzrPwdoo=; b=p
	WsiatfFkv12Lh4bQFqsWqF3DuqQ31uXYoj+AgmiGxekr2XwQ0udKWlNhebPYik/M
	lq6vIA21mQK8lRYZHsn2hzCkYliypn6kZYy32ttL76IlPCjW6zOifZnBZtsbN51h
	m4+HfS2IHUM45UEFGnqhpu3utHgxMgfN70KjxoqZsuWYhB06PxSfx/Vjh9SgpgNf
	erdSi+Sh+H3ofB43wRHJIvAqn83bRgVNUCK4AFAc5kFGk5dOJFn4u5kBuvTeZwUD
	cPgeOzD7cfoMTwUC+ih+7xKwzXIgO6gz4hE/S+oH2QKYfLQ07zyqEq68Q4EoIaPl
	z2+CGfgUPr6lNCXiyVLyA==
X-ME-Sender: <xms:hEJfau3fKUy-VJZx-mN3N7IDxEtNUIOKZ8nCYLM5JEhA_19-VT0hsQ>
    <xme:hEJfag_FYSLNbFkxrInyZaVK_c-UcsdcrYET6YIT84XkgCRTjaTITxUO2N-sbMLL-
    f_dtOJ1GPlOwt7UrKTKGC8mCUhumUXyI7EAlRqlX2PnDDU-ggBvesA>
X-ME-Received: <xmr:hEJfakNoWH3VBOHCdOKfDtiJcwwdeCejI2RqJORrmjlueTVgEPJkgO0EtB923z72GZzhMkRFOlw7o6icYg3ju2W2>
X-ME-Proxy-Cause: dmFkZTGmf1tEZqgGbAiDfqxjePEm1aHiY8idQCAicZKA8CgUO/4jvIkLz4ZsACs7R8z1bq
    Kjgh4G7DYhvWHTcNtE1eFJD9YuNA2vQ5LiC3C0XolI3rSrS41uSt9f96YtLHVjj+H7IrIS
    OdBaUPc1iP8s+JwkOvjexMIW2p5dGrsEhTZTZi5d2xU0s5HvWj8Tk4SXExZHK0u3TungSx
    2aa3sbZbd0ZiGJuLKlpmYQaF5QtWFxtNvOfum1y4dFPhJuqGBe4u8fiv0QSkN0YtAvLHT6
    zhTJc1TCMPScN+UyUWiWikYjdu24Zu0arqS+XVqnFrJ2m/U6Zr9Jm9C530rTMZycEZk/D2
    27Qsu5Y/hooj9MBFjxx6QE2mzUTav5Ul1N3AT+AscbG69cMi9BStlid9cVn1MAxvtFwTw7
    N9/dzo+OA+j/BSt5GnDeNM4PyZi0OG8UVn1+fLwqony8r3SduWaJqbPe0H9Td9MUwuM8Gv
    xfjXH5ptVeHWLyU2Gr0X0b2c/el1rpse0K3t7j5HDWzN3/AUK2ZmRFbJ4nIpaUX4j9OVhA
    KIGK2IsqmduXbhGUm578Zt0eiLfGo/MLbhIufyUaBnckrwIHr+27IN42KCR9GNDMS6khOd
    BZc88UEEHoKEUGMbCiHwKevudN+VPc3prrFqq3rManPB57qaVQIwFC+XI1/w
X-ME-Proxy: <xmx:hEJfasBNxeue4ocr7Ew-tFcLYhvIZelkem-iwmpxSFqJfIyy_yVZfQ>
    <xmx:hEJfauNvZAojszHVLZOE3YZOIGiKqxq5iC-Te76Ht_h7K4yauhZCZQ>
    <xmx:hEJfaqbbZ_vFqzou0GmHm7l7-wWANZa6Mz1IBqbmAMhYmn5HifexoA>
    <xmx:hEJfalNl6OmqX1Sovr4uypWOYIMweTNKCeRdFflBN3XDgm3S3y6Igg>
    <xmx:hUJfauDni4V6LkYAKRPM85CgC6wz0sYaAGPyuWW-TVwr9F5UfX6htJr4>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jul 2026 05:57:19 -0400 (EDT)
Date: Tue, 21 Jul 2026 18:57:16 +0900 (JST)
Message-Id: <20260721.185716.538446175000843628.tomo@flapping.org>
To: jstultz@google.com
Cc: tomo@flapping.org, gary@garyguo.net, a.hindborg@kernel.org,
 aliceryhl@google.com, arve@android.com, boqun@kernel.org,
 brauner@kernel.org, cmllamas@google.com, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com, acourbot@nvidia.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v3 2/2] rust: use Delta and a Jiffies newtype for
 timeouts and delays
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANDhNCrKMdHCmL76LWCROVF2Ly-9NxmfmQ2T+P=iv34aVkO2uQ@mail.gmail.com>
References: <DK1SRBA3315M.32N4T8QQBUOER@garyguo.net>
	<20260720.184751.938933263969124163.tomo@flapping.org>
	<CANDhNCrKMdHCmL76LWCROVF2Ly-9NxmfmQ2T+P=iv34aVkO2uQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gTW9uLCAyMCBKdWwgMjAyNiAxMToxNjowNiAtMDcwMA0KSm9obiBTdHVsdHogPGpzdHVsdHpA
Z29vZ2xlLmNvbT4gd3JvdGU6DQoNCj4gT24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMjo0OOKAr0FN
IEZVSklUQSBUb21vbm9yaSA8dG9tb0BmbGFwcGluZy5vcmc+IHdyb3RlOg0KPj4gT24gU2F0LCAx
OCBKdWwgMjAyNiAxNjoyMDoxMCArMDEwMA0KPj4gIkdhcnkgR3VvIiA8Z2FyeUBnYXJ5Z3VvLm5l
dD4gd3JvdGU6DQo+PiA+IEkgd29uZGVyIGlmIHdlIHNob3VsZCBoYXZlIHRpbWUgdHlwZXMgYmVp
bmcgZ2VuZXJpYyBvdmVyIHVuaXRzLiBTbyB5b3UgY2FuIGhhdmUNCj4+ID4gYERlbHRhPE5zZWM+
YCBhbmQgYERlbHRhPEppZmZ5PmAgYW5kIGBJbnN0YW50PE5zZWM+YCwgYEluc3RhbnQ8SmlmZnk+
YCwgd2l0aCB0aGUNCj4+ID4gZ2VuZXJpYyBkZWZhdWx0IGJlaW5nIHNldCB0byBgTnNlY2AuDQo+
PiA+DQo+PiA+ICAgICBEZWx0YTo6bmV3KDQyKSAvLyBEZWx0YTxOc2VjPg0KPj4gPiAgICAgRGVs
dGE6Om5ld19qaWZmaWVzKDQyKSAvLyBEZWx0YTxKaWZmeT4NCj4+ID4NCj4+ID4gVGhvdWdodHM/
DQo+Pg0KPj4gSSB0aGluayBtYWtpbmcgRGVsdGEgZ2VuZXJpYyBvdmVyIHRoZSB0aW1lIHVuaXQg
bWFrZXMgc2Vuc2U7IERlbHRhDQo+PiA8TnNlYz4gYW5kIERlbHRhPEppZmZ5Pi4NCj4+DQo+PiBI
b3dldmVyLCBJIGRvbid0IHRoaW5rIG1ha2luZyBJbnN0YW50IGdlbmVyaWMgb3ZlciB0aGUgdGlt
ZSB1bml0IGlzIGENCj4+IGdvb2QgaWRlYSwgZXZlbiB0aG91Z2ggaXQgY2xlYXJseSBpcyBmb3Ig
RGVsdGEuDQo+Pg0KPj4gSW5zdGFudCBpcyBhbHJlYWR5IGdlbmVyaWMgb3ZlciBDbG9ja1NvdXJj
ZSwgYW5kIGppZmZpZXMgaXMgbm90IGENCj4+IGNsb2NrIHNvdXJjZTogaXQgaGFzIG5vIGNsb2Nr
aWRfdCwgaXQgaXMgcmVhZCB2aWEgZ2V0X2ppZmZpZXNfNjQoKQ0KPj4gcmF0aGVyIHRoYW4ga3Rp
bWVfZ2V0KCksIGFuZCBpdCBjYW5ub3QgYmUgYXJtZWQgdGhyb3VnaCBocnRpbWVyLiBUaGF0DQo+
PiBsZWF2ZXMgdHdvIHdheXMgdG8gZm9yY2UgYSBqaWZmaWVzIEluc3RhbnQsIGJvdGggbG9va3Mg
d3Jvbmc6DQo+IA0KPiBJIHJlYWQgdGhlIGFib3ZlIGFuZCB0aG91Z2h0LCAiYnV0IGppZmZpZXMg
aXMgYSBjbG9ja3NvdXJjZSI6DQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2tlcm5lbC90aW1lL2ppZmZpZXMu
YyNuMjENCj4gDQo+IEFuZCB0aGVuIEkgcmVhbGl6ZWQgdGhlcmUgaGFzIGJlZW4gc29tZSB1bmZv
cnR1bmF0ZSBuYW1pbmcgb3ZlcmxhcCwNCj4gd2hlcmUgaXQgc2VlbXMgdGhlIHJ1c3QgQ2xvY2tT
b3VyY2Ugc2VlbXMgdG8gbWFwIHRvIHRoZSBjbG9ja2lkX3QsIG5vdA0KPiB0byB0aGUgY2xvY2tz
b3VyY2UgY29uY2VwdCB0aGF0IExpbnV4IHVzZXMgdG8gYWJzdHJhY3QgdGhlIGhhcmR3YXJlDQo+
IGNvdW50ZXIgdXNlZCBhcyBhIHNvdXJjZSBvZiB0aW1lIChmb3IgdGhlIG1ham9yaXR5IG9mIHRo
ZSBjbG9ja2lkcykuDQo+IA0KPiBWZXJ5IG11Y2ggYSBiaWtlc2hlZCByZXF1ZXN0LCBidXQgaXMg
aXQgdG9vIGxhdGUgdG8gcmVuYW1lIHRoaXMgdG8NCj4gQ2xvY2tJRCBvciBzb21ldGhpbmc/IFNv
IHRoZXJlIGlzIG1heWJlIGxlc3MgY29uZnVzaW9uIHdoZW4gcmVhZGluZw0KPiBhY3Jvc3MgQyBh
bmQgUnVzdCBjb2RlPw0KDQpBaCwgSSBtaXN1bmRlcnN0b29kLiBUaGFua3MgZm9yIHRoZSBwb2lu
dGVyIQ0KDQpZb3UncmUgcmlnaHQ7IHRoZSB0cmFpdCBjYXJyaWVzIHRoZSBjbG9ja2lkX3QsIG5v
dCB0aGUgaGFyZHdhcmUNCmNsb2Nrc291cmNlLiBJdCdzIG5vdCB0b28gbGF0ZSBhdCBhbGw7IEkn
bGwgcmVuYW1lIENsb2NrU291cmNlIHRvDQpDbG9ja0lkLg0KDQo=
