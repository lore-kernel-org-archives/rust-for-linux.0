Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F99348C56
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784179565; cv=none; b=LB/qICO31iXhM38+qJIOcGSbB7bNrnwi3JwvtHX1C4xgNR28yRGlORYD4rqMgED6qEzQ7YJ4ScKLdB/SN6yllIuSKVpRU8NNkehOQHa35dGut9vYZJ3MMiNTy6I+1e8uBKQoisl7oNMPJdjJsc80Lfi1AVCRkoC3+hVr/SpxQ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784179565; c=relaxed/simple;
	bh=IsOOwaqj0xupoOBbuYJ0BcDCgxN6dNfuAfQYLZ+rBHM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QS1X1NucPaFBOTlOj326CGqb4w0rSKFqi1ouuPMNqyaYLoJ24ljAvrfDOeFCxJ5eDZ+/sHgfKgvoZRIbR2KKrYJiKLPQzJxiTIWkUeiaM/nbetz16UXXOVjfDwmXpjqaaYMxMKyk93NnXyaQfOqekl7nvFZHM9A6urdNvEKbtdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=KHQhv3UX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=brbiI5ST; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="KHQhv3UX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="brbiI5ST"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 08BDD1300308;
	Thu, 16 Jul 2026 01:16:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 16 Jul 2026 01:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784179000;
	 x=1784182600; bh=IsOOwaqj0xupoOBbuYJ0BcDCgxN6dNfuAfQYLZ+rBHM=; b=
	KHQhv3UXEcVyPXtU62LV+xKuZsdjaLSDrfNS499KDBcNj1le2OlLsrSzsvD3HUNz
	9Dr+hRSN0kyRv4XbBU0rHofu5yuGW6eRz1WqznwRN40BIuzf7yFrxktLuK+eIdIv
	LAXbpQMjTly6uZGX3+TwC3q9QDvlPOyF8ROVz45pMMqbFANUAZK0D2G5vUBLxrpL
	ZGykn1xTTMMlxClwNbK2c8PdzvxIPIst6bi9+1piutoF/VAHv4D9aeJvM1a4mjze
	W086TYudX5mVRjBrrqkPM2fX/iDm1L6doVtRDwJQUObzOP7hgAXbrJt9N7zJ079d
	ECCdcSkAFmAJwv32NRYsiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784179000; x=
	1784182600; bh=IsOOwaqj0xupoOBbuYJ0BcDCgxN6dNfuAfQYLZ+rBHM=; b=b
	rbiI5STIM+Th9KT5BkqaIRHS2/wufAO/mpy7QcSd3alZBqeZRZg6q5BeoH5frxvr
	M2TzIo+AGa5BiEPk56EaELCltETdOAbtLEfoCVO48hDlwdLtl+438jxVnWnaXR1Q
	ZtOanKbaN1BNhugdlVa6f3coaGlMvJlGRuYbwhqV2ZKv/gBu4FSPNzudLEyjHVwl
	v2bfySjJP1A242ErbrkiB2H9U12Ai3pfGENUyQt8bw9fAFlklQcPgw/7ise9KncJ
	nC9sfAuS0NffSSC2gS/Nmfyu1sx1A8nv21Lva0OTfyvAXIK/tETlCtuPy18btc8d
	9X4T5jcHAJ2bnIOChdW2Q==
X-ME-Sender: <xms:OGlYalZw0Vj_gSfH9Pa8x5643obfLsHBtLJzkHKJzHkhiAWTPXzfow>
    <xme:OGlYakyxpolagx1sBa50zDd_WRtjg4u09qe2AyHiduEEfiVUsF3OAEr7cuwUYb5iV
    M2E3zXRvM3ApWj8gVCIkh6xpWKbHcGXkUOXLIQcs1l2xTJ7BtYSHi8>
X-ME-Received: <xmr:OGlYaqIdGOTZK6ezUmt15kVE2y1zONotunardFOvJOigGweKyD94JlcgwZSckrSN41S8NkJvz1qYvjNORTn0UoB9>
X-ME-Proxy-Cause: dmFkZTFAvIr2LuTyqZx5rJTYJXRBbn3/OWPryLLj7aYkTVJBsTgmedt7aID2SVafPKtXJ4
    f1/1INg10OQwuI+dNDvjMJc5H9Xi0SPBebIZr1vONpLekY6IsXLg8EMTAxf/ka7YsdiZPu
    AscAxpKx2rwTKOzyzFd3klMZ+vLP5jaOhCanY9va/puu+YJ1vA5bcRjZDWZR+u1ed0IgPh
    eTde4i6/MBEfZwdGIBxM0OdOqL64gsYrKeErLbIODGuLePMMHlm611hNuQrevoGjxlBWNE
    KiMnpzG5gIDqG0VUxEirumDz3pIsTlGBBlxgZ+MLtsuJ6kSSu9PhbYsBXdTHVerQicBFSu
    MJEvFaIIUvkJHFzxa89LYBFEpzVJ8+iAOaluxH+rRJrRzUpjfDqvzcJ9d8plWSsfe2/0SV
    9rSxNbpUgBvN7lqBZwaVsAAfaUtOel7FHa+p9L2uAEcKcXNY+4XbOy9BqGGXDpX1fzhNgd
    7xpl9h9Y2EgLGW3k9jR9MluUkqLbxE9tPbxrAIdrUlCeOL2UfO6BIjn4Ght8O+4rf6pO4M
    CsllSjGhOQA+YJBFCqp+xEkfip2/oeJTAPsLCTbq3K2LMXq8xqTjxVgtTcv5Ej0p6q1n8Q
    iTIpYMlqE6FkUo1QgJyaDyB/+UAoPpLbLxTsruTp0msE9F6GerBexmOauYbw
X-ME-Proxy: <xmx:OGlYardbmod3TzCKjkwQcAIG2YRdf_vOJ8XQfkHDffQo4lhn44kV_g>
    <xmx:OGlYaivgpPMbes4KjPRq99wVsSCAmU5bDkNLbDUhqXx2zi_5SJKTcQ>
    <xmx:OGlYapFzTRSDJRpueLxHHY-p3YOuV4P2r-TxndjNVANAq4gnmjI5tg>
    <xmx:OGlYasckbCau_igSMrVVazB8NI48VILksx5RtOS76MGgo-M-rpWDtA>
    <xmx:OGlYajEug-Ubg-1tReVEUTJHqxx-XowBt_QurO3SZ4zf8CSiV-LKrwlU>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 01:16:34 -0400 (EDT)
Date: Thu, 16 Jul 2026 14:16:32 +0900 (JST)
Message-Id: <20260716.141632.562265692045070440.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org, tomo@flapping.org, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com, acourbot@nvidia.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/4] rust: time: add jiffies conversion helpers to
 Delta
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72n8-=QF7T9d8hon82eQktyRW-_1YsCQwnLZaWmmcx1hUw@mail.gmail.com>
References: <20260715.212021.485543459172925773.tomo@flapping.org>
	<87cxwogywo.fsf@kernel.org>
	<CANiq72n8-=QF7T9d8hon82eQktyRW-_1YsCQwnLZaWmmcx1hUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gV2VkLCAxNSBKdWwgMjAyNiAxNjoyMjowMiArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBXZWQsIEp1bCAxNSwgMjAy
NiBhdCAzOjM04oCvUE0gQW5kcmVhcyBIaW5kYm9yZyA8YS5oaW5kYm9yZ0BrZXJuZWwub3JnPiB3
cm90ZToNCj4+DQo+PiBJIHRoaW5rIHdpZGVuaW5nIHRvIDEyOCBiaXRzIGlzIGZpbmUuIE15IHF1
ZXN0aW9uIGlzIHdoeSBgTlNFQ19QRVJfU0VDDQo+PiBhcyB1MTI4YCBpbnN0ZWFkIG9mIGB1MTI4
Ojpmcm9tKE5TRUNfUEVSX1NFQylgPw0KPiANCj4gWWVzLCBwbGVhc2UgYXZvaWQgY2FzdHMgaWYg
cG9zc2libGUuDQo+IA0KPiBSZWdhcmRpbmcgYHUxMjhgIC0tIHBsZWFzZSBtYWtlIHN1cmUgaXQg
d29ya3MgaW4gMzItYml0IGFyY2hpdGVjdHVyZXMuDQo+IEl0IHNlZW1zIGxpa2UgeW91IGFyZSBk
b2luZyBhIDEyOC1iaXQgbXVsdGlwbGljYXRpb24gdGhlcmU/DQoNCllvdSdyZSByaWdodCwgc29y
cnkuIEkgaGFkbid0IGNvbnNpZGVyZWQgMzItYml0IGFyY2hpdGVjdHVyZXMuIDEyOC1iaXQNCmlu
dGVnZXJzIGNhbm5vdCBiZSB1c2VkIG9uIDMyLWJpdCwgc28gSSB3aWxsIHN3aXRjaCB0byBhIHU2
NC9pNjQtYmFzZWQNCmltcGxlbWVudGF0aW9uLg0KDQo=
