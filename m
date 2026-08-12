Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DC733987E
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 00:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786494407; cv=none; b=uIt1c00E8szPYuO8vGMlLFxVTzAJaZvlhk9Ucdy0qNl/BVar0Hyf9ufjXbAUdgx1ZyvxVWIrjsVeUQkT3ge8fGqgL7SySHf1n5r/PQPE9wtcVyQEAeAzbUymBbuJxdMj7q/IIZZHYPsD8z77dllziyBBXhb4V94cxUUUB9uHbu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786494407; c=relaxed/simple;
	bh=hASgLQaTCbo0Ou/l/0gQf5wr3J/WIYWKPFHAwONXcYI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fW20PcWfVPHTZVsWAgE5E42fu11xa1rX2PT2ZLBxspaFGAdhvzTLtLCHWkO/iz4FjmjdJaxxHhszOPOugDB7dfu6Z82lgzXuuVthPisR96FF79IRCQeoqwC8EI1ps8N1W8XKuCcuHDc7MCuqUINUHdHVWHOCHLkGnPHaMso4Vcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=jmjgbgs3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BV7b6x/P; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="jmjgbgs3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BV7b6x/P"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 8CBD213801A9;
	Tue, 11 Aug 2026 20:26:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 11 Aug 2026 20:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786494404;
	 x=1786498004; bh=hASgLQaTCbo0Ou/l/0gQf5wr3J/WIYWKPFHAwONXcYI=; b=
	jmjgbgs3EovaJpxg0t2LuE+86doAvb2+RuSjs3LL7H20dqi4Apmeqcyg3KHybVXa
	ycTOuRpON/KEWc/PNCB9PfbAZ0uo7n/wKR54+2y4Ua6DjmAHRDW0zSRgrB9ABlX7
	NJaAGVCKPNw5LbPH5uzAjhwuRNDfqqKXK0Oa0bj31KBdsxvIFaHiuRV6M52M7fBW
	dSfBzx4FHTIER3piiyhf8OI1xJFitVQXKoYdI0AEPbT270+CSDvrTpO9dARj+A5/
	sFRiYSFQGFwwAQW8Dn+8iv7D7hDX6rQbD31cKz0Z/AC5jHhteBTrQVxJ2+zJCTWV
	Dei/9GGqghAIzC76kdSCNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786494404; x=
	1786498004; bh=hASgLQaTCbo0Ou/l/0gQf5wr3J/WIYWKPFHAwONXcYI=; b=B
	V7b6x/PWnxBLJjwqgq6SM2yx6Fw20qs0GpUQlxg4phJ9LqyTCJEcTr06TvwYupYZ
	dJVnL38zqhgwDJQVUR+Vr5G0kpU+hQZ7SmPIdu+h11P8DKPqvyWSk0QIpKeztoqt
	F4n8aNlxkDwp3VZjBiCEi5VeJvjE/zck15tpxAAh3vrDVRzn/3+ZBzXCKR+D6tz8
	OL/vaovbG7u6fO3h0l0dCkHNVbZG+pWJcgvJcG9kmKXLgL2rp1yyKpfyUbRg5UJs
	fAcrQRhaMnmwDZiflECnwJXimNbZuxssiMfnvzjlaIWpk0e/vxTiiscXtRRsUves
	CcopFBJpPq6JmNw8m5M7w==
X-ME-Sender: <xms:xL17aiqazcw1IHC53x0_Zp4860WAZSsv-FRwLLX2kJ_oVn0H5IRyqw>
    <xme:xL17aoK3uy7sfMRWRZdNvl1Z1e7Gxnmlz5uU-LNTJyHhHd-b7f5cM3aLfp_wHAMeA
    vIl-CisMyVgw4Do4aykO6mmAsXM2Q_XAOlUfnt0Qd0fhcqGrWhLpwQ>
X-ME-Received: <xmr:xL17atQESP4BFL1oXxz73lc-8rmRSQOulEgDILEHVjd1qKu8rkjyxOq4AKlo8mcq6E-uPyNCMHE00MhSbLFaBlWZ>
X-ME-Proxy-Cause: dmFkZTGP2WVDoWFMmUGZHpmrEBDiI9ox44RERkxLe+Sm8OnKOaenBMZG8Ka4ehiEw6dnnD
    W4o6afPzp16Vq4KJGsO83Tt/uDmAKZMdax3XIqgqvK6vs+cddJYooLePNeY02Bc0vYhNn+
    e04OQRv8o3kU/kVS51SVQ1EtnsAxv2i4p+TJC72KZxkzAidXFgbRIbG4t+fI/CXQIoJpgl
    XKhORwftLvuuAc+FT+MDqeob4gOk0w1dIkKBtFxh9b8PX08HAFAGZ0cgJSj5uqu4dDep14
    MvjvKDC60MVHyQQfhMkWQ/sKjIpEmP8L/qoacE6X+Xt5sGtD1uXunHWeK3tEzIvmP/yjHC
    nO2ft1/Jkgh3Oua6WYH7CtKFM1/9HN513PLUP5jMus61eIWXBPoMUAfp5e3focvytE7/YX
    LCw/44dgIOafdOFhYsVR/5aKlklNv8SBwUxTSLplTAJVjtNcvaHQPihnoBu8u+zxj1Bymz
    zIqAZJP7eYcx4gQtcJ7I+t3I8pANaLlaPf/tqZKRB8H5+ds3iVJcS6BExLT4tSDMGFPVGi
    +XdVk7Q/XUT+5GMJyvDj9WSDbkZNiXySwJ2den041wnkKh9kimxkfcznsaSC7wb68XZoES
    piFi4HSiOc5k1hmJeujAkcNNcdJeJnCSvXo3fTJpvZGHmpLJTBUmMZ9mVAcw
X-ME-Proxy: <xmx:xL17av-PIZS5uJeKNFcSCKlm1jWi4ZKJk4uBhMO9F6X0YbZO8geM6g>
    <xmx:xL17as9KaxhVHUYtK6N1oE7y2c-z_Ka8dgMOpCd0NO9bhaaSAJHECQ>
    <xmx:xL17al4n3IDdSl1MgkSE-t0zoxqNaHtkea7uYglK2BzT8BiyC39Udw>
    <xmx:xL17aichflwN2GKnxBeIj2oc5QtOLPfbnmP1BTo_kIIxTMhtZpnvdA>
    <xmx:xL17auWL8ET5ET2zyUILi0RNS5VOjuG2IOGyYveAchpX5iLXfHbAn08n>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 20:26:38 -0400 (EDT)
Date: Wed, 12 Aug 2026 09:26:36 +0900 (JST)
Message-Id: <20260812.092636.1678270646341906741.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, gary@kernel.org, a.hindborg@kernel.org,
 ojeda@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 tkjos@android.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v5 1/7] rust: time: make Delta generic over its time
 unit
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72nYwjwSiMnMURNa49v1yfRT+LRAe5KaYShhUkN79H4nZw@mail.gmail.com>
References: <878q6e2p6f.fsf@kernel.org>
	<20260810.211542.1020667562439851698.tomo@flapping.org>
	<CANiq72nYwjwSiMnMURNa49v1yfRT+LRAe5KaYShhUkN79H4nZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gTW9uLCAxMCBBdWcgMjAyNiAxNjozOTo0OSArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBNb24sIEF1ZyAxMCwgMjAy
NiBhdCAyOjE14oCvUE0gRlVKSVRBIFRvbW9ub3JpIDx0b21vQGZsYXBwaW5nLm9yZz4gd3JvdGU6
DQo+Pg0KPj4gVGhlIHJlYXNvbiBmb3IgbGFuZGluZyBpdCB0aGlzIGN5Y2xlIGlzIEdhcnkncyBw
b2ludCBmcm9tIGVhcmxpZXIgaW4NCj4+IHRoZSB0aHJlYWQ6IHRoZSB1c2VycyBjYW4gdGhlbiBi
ZSBhZGRlZCBpbiB0aGUgbmV4dCBvbmUuIEkgZXhwZWN0DQo+PiB0aG9zZSB1c2VycyB0byBjb21l
IHZpYSBhIEdQVSB0cmVlLCBzbyBpdCB3b3VsZCBzYXZlIHNvbWUgY29vcmRpbmF0aW9uDQo+PiBs
YXRlci4NCj4+DQo+PiBNaWd1ZWwsIHdvdWxkIHlvdSBzdGlsbCBiZSBoYXBweSB0byBwaWNrIHRo
aXMgdXA/IEknbGwgc2VuZCB0aGUNCj4+IGFyaXRobWV0aWMgYXMgYSBmb2xsb3ctdXAgbmV4dCBj
eWNsZS4NCj4gDQo+IFRoZSBsYXR0ZXIgcGF0Y2hlcyBpbnZvbHZlIHdvcmtxdWV1ZSAoYnkgdGhl
IHdheSwgVGVqdW4gaXMgbm90IENjJ2QsIEkNCj4gdGhpbms/KSwgc3luYyBhbmQgQmluZGVyLCBh
bmQgYXJlIG5vdCB0cml2aWFsIGFuZCBpdCBpcyBsYXRlLCBzbyBJDQoNCk9vcHMsIHJpZ2h0LCBo
ZSB3YXMgbm90LiBPbmx5IHRoZSBSVVNUIGVudHJ5IG1hdGNoZXMNCnJ1c3Qva2VybmVsL3dvcmtx
dWV1ZS5ycy4gU28gZ2V0X21haW50YWluZXIucGwgZG9lcyBub3QgcmVwb3J0IHRoZQ0Kd29ya3F1
ZXVlIG1haW50YWluZXJzIGZvciBpdC4NCg0KSSB3aWxsIHNlbmQgYSBwYXRjaCBhZGRpbmcgcnVz
dC9rZXJuZWwvd29ya3F1ZXVlLnJzIGFuZA0KcnVzdC9oZWxwZXJzL3dvcmtxdWV1ZS5jIHRvIHRo
ZSBXT1JLUVVFVUUgZW50cnkNCg0K
