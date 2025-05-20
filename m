Received: from sonic305-20.consmr.mail.ne1.yahoo.com (sonic305-20.consmr.mail.ne1.yahoo.com [66.163.185.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537861A2C11
	for <rust-for-linux@vger.kernel.org>; Tue, 20 May 2025 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731475; cv=none; b=dWPapyNRf1BifH1OEzht+BQAUQ0VDRxgmTpqkDBGUYCyB2v6S7K0u2ODO9OGdKd9ILEdHVPyrWjn51/VN0ABftMwRqgz7zBmEiUnDSuyZv1xDenjjw8aetR8ofs2NL004nCCHt1506bJJfU5Y4lOWqo4MTV+7waTL3LJggu+OfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731475; c=relaxed/simple;
	bh=NAvSNAt0yhYG6zuTm+X2rnb3eXs7MsOa7P49dsQifgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBQA4tRR48UR3oO/8bgkq4RZLv9YHKsfkNlaSxwWCoz5ht6kapE7yNCAMb7mWdEaG3DRndacn+Yw7SqpBZuQr/+ST0UiM278M2JL6G9+mXA646khE1MXP1eoR9P+7vA+HHI2U81FQC0P7g7koxxjW36LRAVFLvDIuu7XSXNI8/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=AFQ5r/wQ; arc=none smtp.client-ip=66.163.185.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="AFQ5r/wQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747731472; bh=aJ2cC4mpCnTf0lrxz57JMEmV07rS/02p3iQ6jRKyt18=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=AFQ5r/wQfi0IQetxMV7I6rYTewW01/mys6mxLnLshUuuoH58RE3JEhQ/k0qD5rjePYoHD1ttgQsvGI+WiCAjv9DGUYdf0aY36ZNLebWlKIYueV54N+YsYvOqqq6xsZjCVM69X+q7hNbDb9QU1QFtG72AdR3szZjMHB4hulyc3xTsOn8YY2BESnHLIs7jFbltcls0q9qC0iYtFXigCggEnYC9I9FBkYs7ZtXpSZGtfdt/Qr8MOuf5eZlo0BeHWIA6QEJ0sCy3XjAO6eWl9rOFKlNfOYlXuuI0E5uLm28k84L3YQcCAqjo2rixSm7YAPvFbxCuj+r+v39SLd9xqK6LhA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747731472; bh=bzUX69qHjNe08EdEmVaZ+UI1gMRP9ZCVZKjnFIWHx0c=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=l4Ep6seMc/nggtCz7o02ya8CrQrD+3EJTMVcdFc47fognC7TIjLVxHHjVH5+z2N+FDy1gF4eXr3MZyfyJZIqFlhc21S34nGREutdufVpoaWY9HEZ4hqZk99+YQSJHTpKPTfPNAPa/NCu6x05ZcTCjkhMK+MHnQvU8fOSNirQjTNcFEmeOK5w1qXb1Sf/nqiJdp2+YU3+D+BPlHSL1Zjy0x/HpDfcVLWkvKO85oSiwMTPdfeqDmNDvDHAGeoxwqmkxme8zb3G3wUOF8mGqNG00H+sD9i9VPZubi/QYz54tIq/Yz2azICx0wvDUAqfuOShCMzt/lNMaMNf7YC68kR4jA==
X-YMail-OSG: umPO7YUVM1kddzdE_bLDYG8wc5dinyIEmTBs1VXaRiA2ONhB7fNh.EsUx.tQsed
 nZCRWG8wK8gwmTaHF3Ccj6h7QSz.U44m6.DNveqFi.QXHZgxGx9XUOmwjDiyoaS.PBxxRyHVoCb0
 pQEllkpb.stZmWgeOmKFlHJYk8SDCYEBf3oROVoDhAe3jVC2nZyz5D24qRN.S3Kq8cLzNQ4GWv86
 sbqnoL0y2ziBjNbiOg6deNoFcArJULzH7ISOTbDRG_bPrs4RXl4pTdikdLmHGt7o4whzP6CXnv06
 ng9j8gZdVrnFD0JPlMpYxY56D1fVFUFDZtIIERo_SvWgO_OZ0qTnMmz4M04PauzVAVmtr63pNSOI
 mSBZcsfPawQzJTJaIBO6ss4Dh321BMD6IrN6WYV7rtd8vg_7XO1W3Qmqf7jiu6e_GiX2aaTgV_Ja
 deokGeltj4Rt_7pnbHVYdTuDfESVEBfjSCJebVKOUVeI4r62RcUJZpmFTu7n0lpE_yk_FOuDMXnT
 DH7yWHDHDUukmYtZFFX798HkDsK9tUjrqSk8o_DofNcw4Nox1gBZ6B6zYAMAZq4xJQDAVPZ_yaHA
 ZFumCm6Ou.XUHxNwSkpOOATYLh8u9d_Qm1UrjDACQzBBfdCBzEjwSOflna1PetgLRJrLp5SNAWCB
 4ARTxjEoT7OvYljzQ7eSUgYLeGvumlKz4o4Ny2hkodR763QQSv2_EPCe4sexgMuTs3tcfi_V5zLo
 crN4W0K6bRSz50m6YcOEjmY7XpA6HJ7WawAFgMAAjTCaz9QN5YQbwO9J7VX7ala_11MlJHMF_P5n
 JugwnMmxZdheGpkviySVKhnNdlIyF8bOuJwRCg6EckaJclW5GJ7.mN0cPMfwVj5zkjshnVaOypzx
 IRZ0mF_x.44vOo.6zatcSVWCgp2dlD_pYNpb_6HWuXM1OP20UG_eRvF_OPDSJfEgLWUQ2_2foOpd
 flqs.c4Lgwl9twTN.8sDDlmDAsGMomRTlK.nm39kNTWjcyZ5P2igmpsiLH1GX1MDPZSnLzeFH9Ym
 D.drWFKwOvDYTcV5sABc8GRZoOjw99STDjw.QAkJPlj0TOB_6P1cCFEIFARbsaVR6wu7nIHKsIde
 kwC5nE2O9HmMZTmfxdGjFp0pUvyhvq8pywMWImswJutD4.9ute468Hf2iVDDa2bG0ltyJrMbZf84
 .gboOf91vroLEpanXoWB1tVXycsfx.cEbxFxk6o_qRaCvOhoxhbUOKspyI5oudHva2r0qtqcu0s5
 cM9WdFMPpzF87LpgmqqgvpmW2scjLObZkM.d11MK517gfIdEzxNEZj51Az6_KvoBvAderHDjYnkN
 y64UPvvRqhq7MohzW8rOAHiqLAS.U0jJWVz1EzKb0v8BfXtLKZeOUPCCxq43YtsVWvCpu5bGEoub
 W6EMaBRyv59DEp5g8l6bWLQemQA50NdPt4_Uxb9cAgiPQo9vkiHFdYsyRnK9eob_.wJPyQBre6P9
 sUAIr_BU86.WZHivJAJKqdf_PIali05kJ4dojKKad1RC4fGYIj2n__t1Y6ph5WM.jQDhH7Ul3ut4
 b.wHQrq95KVdVuYqcbuLZJWon33e2LG8gu.zSunTuW2aLG3U7i098E9XnbRxC0UFftWVhdpq0RlX
 niCbCGJy2ssfMyy2zRjeJp8RKl_L9EYIjafkaCUKB6QB3aWtjQgbOy5.grI8mzV3YbgjVBHaclKr
 DnlREdvwaSlhfqfM2K2CX..yNyqv_EavBAC2bTzx9JACtrChJUvT0bDgG0aD8NQ.dKHOv_azXWN5
 2hj6iSdzdOcKTf66nwsPV.gKWwOD5N1OpQe5l11juxxwSGxii_qRq.nGALb3KwGrKDChGcO4h_qe
 mpztJ0.82QdnLwmV.Y_b76C8_KXPVFZw9DAnPHJ74JyZkyiUkFvMOFIkRyhp3Yu4Irq3J6ojfcFp
 EkSOKmwSl3rygokxxBt51rNhhOxTo4C.aFEx_5oHZSRpEDreF.wMxVfJiVyHeoAvLIzFe9Ip1DHr
 bQNZ.t9EepSrmBeJUlvOHttqGiZyLQfZIDfujX3WNmfCDI7g5njiqymZCYuwfLzaaqT_q0GLIbUB
 7S.Xc4ekIBKzwB6rF2k.aNcNkstkcBPN1yhX6Zk1XhI9LmxMx55M5IoADyfHeyiahFu9mhaHtm3u
 9eyDdZNyRKzFJLbzT56Y3Hok6Zt31qIuoxgTujP_nzKlPha5Ha80njsT0PjPkDi.vbrJyQ3PjrJ5
 AElWrTo43HfbbuDD1ZVzmfUexqzPfP_42znCMIA--
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: b7babc4e-cad2-4029-b35a-b6cf77f99ff5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Tue, 20 May 2025 08:57:52 +0000
Received: by hermes--production-ir2-858bd4ff7b-4tj4l (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3d6a204cccb7968eeb622c70860b55a1;
          Tue, 20 May 2025 08:37:33 +0000 (UTC)
Message-ID: <b3a12c5d-4224-4c0b-900c-f7531e9fd4db@yahoo.com>
Date: Tue, 20 May 2025 09:37:31 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] rust: macros: Fix macro referencing core and kernel
 crates
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, Benno Lossin <benno.lossin@proton.me>
References: <20250516122349.1944895-1-igor.korotin.ref@yahoo.com>
 <20250516122349.1944895-1-igor.korotin@yahoo.com>
 <CANiq72=ErVyyszgnH0W56Bjvakvdcprh-Z0pXt+Pc25q4z_Afg@mail.gmail.com>
 <54a0b100-a860-4c73-84aa-e5377bbd692c@yahoo.com>
 <CANiq72kU7hw5GumRkixwQ7CirpmO+KFmmTD6CLczmX902=_XSA@mail.gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin@yahoo.com>
In-Reply-To: <CANiq72kU7hw5GumRkixwQ7CirpmO+KFmmTD6CLczmX902=_XSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.23840 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo



On 5/19/25 17:49, Miguel Ojeda wrote:
> By the way, I would probably avoid the "fix" verb in the subject,
> since this seems more like an improvement, and instead use something
> like "clean" -- if we consider something a fix, then it should have a
> Fixes: tag pointing to the code it actually fixes etc., which in turn
> typically requires splitting the commit into several, adding Cc:
> stable, etc.

Thanks for the clarification.

I'm happy to change the subject line to avoid "fix" and send a v6 if 
necessary — just let me know.

Thanks
Igor
