Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7336B04E
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041558; cv=none; b=lrtbbG/0DETw1kyIs/RrPff6g3Mfp7a4zrXIM9JeOcmuaPPbVpBS8LSkGyH+CwE1ThV4NkooS/lTHA+Kc/D1OFm3PWMApDzhkiDmn6O1WmrOvCp4XF+m8KpRSNFaPob0G0whuWb2Y6a3rLljj+RQct3/QZelXjwBBTgJ37Z8/f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041558; c=relaxed/simple;
	bh=0dzF/jzvfD0nbynIcZam910ov2copVWoxn6SANyZjGk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XObkt6QEN6b4cqikpXfXCo2WAllQck1l6V0hXDJ2Ueb6adyP7S5/zFnhlThPwsBWA0ibyxtVioV3UhyZ5DLk8hTy2BS5KybwArSUjRP46Sx4wONu31Rs++BTtaaIgR4HKZ9FB+1AmavVncT2xpvHDO6SYFEnNI2FKfEXV5kwq14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=ANO0O9ZC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gJ0m7kjJ; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="ANO0O9ZC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gJ0m7kjJ"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 598B6EC0266;
	Wed,  1 Apr 2026 07:05:55 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Wed, 01 Apr 2026 07:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775041555;
	 x=1775127955; bh=0dzF/jzvfD0nbynIcZam910ov2copVWoxn6SANyZjGk=; b=
	ANO0O9ZCbqovWVoQrcGdCRu7jy277+smCOFDUtGOmCZZBB4MDHlTZDtZs/A5bHze
	eWzth6+OHHcpQH82KcZb98qje3M7gd9f0DvMkah76zQtZv/2bwAKgD+DTTCIl2c3
	loccFh4HrzFBPBm7LRjYxqrhvRpGtjc8BaAtSwHAtRg9Of/5EFbEpXGCW0tjld2D
	Wu20jQqq5+aR3YrRv074snXYoIMbiwiibKKaT2Pmnk2/frkIeXjh//a5x0LHhLYR
	GWtZyGrlTP+NKxJnHi3pnckGrfKvKO8fDghtHlzUPV90reUtDerK6JF5IxouhUPu
	2j2Upo96nDBRfUASipP+6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775041555; x=
	1775127955; bh=0dzF/jzvfD0nbynIcZam910ov2copVWoxn6SANyZjGk=; b=g
	J0m7kjJU8CVR8BIJotAx1Mrkb2L0OeonH0U1f6D7792hZwtRKtqJaWFHLre0wEuw
	o0QcUWZGMacNada8tvzJHKxG94v9h7a5uDfWg9ABVKWej8LDNxsS/yVw304T/VSG
	zlodsIZuiUXkADhUT4nGClgoboqQ/TdJwW2BPn2cnuq8CdLBc5+V0CUcqxaS8KlP
	dgjILlomlGgDHccnU+YZer1FX8DxOmgzWaSlZCwrvoqcckkw1BVTFNAjnFB/69gM
	8sTJ9M0atcXRAoxL+/OMlS05iGcGhpIGDgBlYR8N+D8k+FLOK8+kzBS9XTXhtPBB
	C0824FpFGyJTLEMjR5TnQ==
X-ME-Sender: <xms:E_zMabIzCUY27pKDACdJSr3l_CmCbG-peSeLOUuFQWZZ0NXHyUzLjw>
    <xme:E_zMaZ_CA_ZSXs07-qN38AUQmDZy8hxH2Vqxq140LTDSVEkxTqZUYyhmtr-CCeSMw
    ILQYuSi-36V0Wz04G_nBvf0EnG0-nDa7OZbJCdCoMJ9V0r3MDt61A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfffgrvhhiugcu
    tfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecugg
    ftrfgrthhtvghrnhepgfeftddvgefgtdejvdefvddutefgvdeiuefgudffkeelhfekveeg
    ieehtddvueegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnh
    guohhnihhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepthgvghesjhhklhhmrdhnohdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsth
    dqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:E_zMaTzDyrVg2p-xbQK0V8lgQ6LZxkGXJfLvYIDxJSDIRqzrkXDrmw>
    <xmx:E_zMaZEWLW_1grjMMKW545JFU6OEj13lWMD0x-kGKvUyx3JvBXAepg>
    <xmx:E_zMaXwXZhG4-a0SDEkR4V6LhrgqJL0gJe6qSgCAb1B2lXpi8vJ0Cg>
    <xmx:E_zMaau1d54WTxMTUbtQN-4bcvCxRoEtpDSaEG7D25KIZpHDKZgvEw>
    <xmx:E_zMaR88xHORPhy6JZ6IksWDjc6yDCzIo-MB67KgkaOUiuoG0EgNW_3_>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 224B615C008C; Wed,  1 Apr 2026 07:05:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AHGSV_wUTa23
Date: Wed, 01 Apr 2026 13:05:34 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no,
 "Miguel Ojeda" <ojeda@kernel.org>
Message-Id: <0357ae66-f3a3-4bc1-b96f-5231cf544080@app.fastmail.com>
In-Reply-To: 
 <CANiq72=SkdcggDkUhA+46pxurgfSveA3KJjpvT08RKN6MkUeyQ@mail.gmail.com>
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-9-david@readahead.eu>
 <CANiq72=SkdcggDkUhA+46pxurgfSveA3KJjpvT08RKN6MkUeyQ@mail.gmail.com>
Subject: Re: [RFC 08/16] bus1/util: add basic utilities
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 31, 2026, at 9:35 PM, Miguel Ojeda wrote:
> On Tue, Mar 31, 2026 at 9:05=E2=80=AFPM David Rheinsberg <david@readah=
ead.eu> wrote:
>>
>> Some helpers will become obsolete, once the MSRV is bumped. This is
>> noted in the documentation.
>
> Yes, I am bumping it to Rust 1.85.0, so that should be fine.
>
> However, `feature(exposed_provenance)` is there since 1.76, so you
> could use that already.

You mean enabling the unstable feature in older rust releases? But there=
 is no guarantee the methods exposed by that feature did not change whil=
e it was unstable, right? So I would have to verify that nothing changed=
 over the lifetime of the unstable feature, at least for the parts I am =
using.

Anyway, if the bump to 1.85 is planned, I will gladly keep the backports=
 for now.

Thanks
David
