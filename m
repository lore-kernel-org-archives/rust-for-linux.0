Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706322;
	b=Hgz/Y5nLd3T0M1/T6AyIKkqhdQ0+2Frj35o79BoN15TYv4gSC3m/gaqbjkR1lWomp4x7
	 6bP7C+GMqVKZlq7K72Q3msqrFeB1QfaZHZlWKAv8nxnKsMhrV61SnaZY0vSWcKT3rDd9h
	 fcjlHWiFzbuzjCV2k9nQrxteXVVyzARSx4ehr+Fi8Y3grhdlaPVUG1QqtVYR4jtgKj6p9
	 hnBvHjGX6LRo0funTfGmbevy6tF8VciOnDOwLTAptZiNi2vnPHYtiEuOph25jdvm1jqvj
	 6T0vQgsiAueGwDqS5Fmm0oJJ+bBg1b0W5HhqN+gHW+GOZVOwq2eIQ/UBOtmbXfnGZHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxvkJiAgj3kjRCLEyxOYum6TDgyCWdasHNqflcDGJQY=;
	b=qs7Sn0RDsm3W1TkOuM88DBQ4zzuGMDiM7xNUQfYvPm5zgCetOG11lQDydV1o36HEpUTZ
	 OxZh0eV73JNBhgQzmhCJsUBbbXTQe+fJbBt4ZaMmToxy+o0wDhLyHKKkO9WknVxmk/dUX
	 VUH+zzui0OuefovbleNkgfN5mfZnJ4jyRTDMPaKyZNIfmUsgG1BadetP+CUQQBlcfjiQa
	 t1L8C/tYeLcepvR64CVNKirIh6XV26XVQiWCB0jrRhwjiIZ42Je1HIlTD1o5un288eYPe
	 cNF6rClntOLFHjxgTC7WxGP5quwurebmDrI9GyfF0TMdr0PibUdgl++dCAgenuTcbKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFaErqTT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E5F606D837
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 11:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E5F606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFaErqTT
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a0eecf73fso690701eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 03:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793706321; cv=none;
        d=google.com; s=arc-20260327;
        b=Y39lvdN/S4iETWNEtqH7Pam253ZIaP8xoz8cHJrK/HoKH8h6VNQSOo7hC68kbkkMzH
         A6I3aY9y5fk2CvRh2IGJrc/SgN2GBAnhZ65h8ClNF9zImJeRIPfu3WDrii1y2ebeMC3E
         YQEJArlKJtEIFKB5TqEsjoMeXjbo15DCAdC/uEol6Tt25CNLvaSyoTXm8nn9xI8TZMdj
         KILa/0Y2lnxDUOrCP7HwVa2guv2dlCw/oaYc0IJncWTcW0feXjULkSjYSv1Ae32oZy4b
         PqWR4v9rxViCxGhZHKuHAa0tW/kD+uBcSLp+Zj+h9Nmx/T90i/YswDEIQeSGeQ46eYs3
         HUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxvkJiAgj3kjRCLEyxOYum6TDgyCWdasHNqflcDGJQY=;
        fh=4bybMtBaiu/a6PgJiaQ0kLcLssxCTOFXJNzxEMR4bTw=;
        b=BhVmO42oE9d/UMolsUXuv8yW1+ESRlnGtUPruR7NymFrrYc1TPHyW19X+JdMPXUbvi
         iZWxopr0/2cKBGgdVTqD1nq18NFVBJEaYwerRdrBmoT9/NV+grKGJJpKpBSYR5rXar17
         EcwLpG8e23IB0evqjzCb9AIWJl43F2VG6GOKtR5MWqb89WohpzXsWhRrzuwYXxOMLUw4
         1/YKwGQY4QYBBxyr1r2CQL2doYKGVt/MnkZhQ2o7edt0KNZXqzXu36F6tc0zLL1sAmqc
         fdRJgWniRneCbyRWX+CR+Dhk7BDfRhW8pYriqYmtesFe7UsEWIGLtbjNiX6dAxceGmSJ
         GCkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706321; x=1794311121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lxvkJiAgj3kjRCLEyxOYum6TDgyCWdasHNqflcDGJQY=;
        b=BFaErqTTHEoE54ZwO6sDNdoDj5pTfzCDYqoXFJZgWNKmNpfBEseV/cB/jYR1/ASN8f
         qqtSHzo5eD2bieTT0wCzc71fMTEaWKyMqYk6vwLGTJXcvbAUnatD4S1kx/CREdFeTaEn
         ONYxUaOO7VInkETA3bBCy2Y8p54cnu1/QBo4lx59KmjaCg78F/WQaUa6wFpVEaj14C6o
         pK0Z/TfZ/mEICEX+LUezpTLjQzX8EqLLgO7P1Y5++6IYo8pMk4IrdaabSCmeE0dkOsYZ
         MZvqjGjmL8NX++bL5CTbtuavvOvQyaNGY94WN4shNyymvpklhpiAx5qS3+dU05x/LBWj
         x3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706321; x=1794311121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxvkJiAgj3kjRCLEyxOYum6TDgyCWdasHNqflcDGJQY=;
        b=H06IsIYHWyBxm682mFhQHr/ig5buqVA5UJwNQJTsALHyLxIFPvUcfYcuZ2mNE4Zdik
         7LFCMd6PbPQKv7t/Ls9HS6oZHak49+K9gcUktWdxEj/y2ifKCPtPZ31yEX6nSxxcFwGt
         k4iYkIXw0sX2f5daCF5V6McJBDZ8HEu7DSf3imSGQCIFNjnVCkdMMnf5DP0326hurJy1
         RQUp9Nzx4AnKTV1kJV5Rvos7mAnMGtyoQXhG86zqYiLZEVQ9F/3IIup4GJja+5tZF3BT
         jYhMimbGjxZ331Cal4ZA1lifU6lxTV6Vua3c8aGBHZWbSwCZtrd4Qf5g5kIeAGsm2u9R
         n4Uw==
X-Forwarded-Encrypted: i=1; AKwUvBykOJDkxMdLl/UgyM0vc3b9chzOgQS4a7Wv5319YDj4233LYxfrATWcTfLYk1Pyc/56RorsACZPBYj9m0ojmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9VUC5Kjl2GInxGo76QCKxCWzQLxA+M0g7vpUP6uOy5rtBf/Lq+
	QIKAR9fktYZhPaTU3jM/2a3v+1NyFEayBfelvUNv7buE99ZRTMA+0X2Fra3wg1pmePBFU0YR2eA
	Lhaio8vX45fsudUVVar4iNwDe6I+j3Ps=
X-Gm-Gg: AYBFou1SAwOjl6vcfZlMDNRKw2M8C76SG9USH3/PjR09uDNrP3nPqcyNrmSHd7XrBKC
	d4DF+vAHy0+s9h/TAg12vWorwmU6L1/HIqHUgs+2yiXZsWaRlqSAg/ySM5/IoycymbSUFsNXLYY
	qCcs/QykO27MHmdzzpEhjdnoM/PrxP0RRh9gtq9vL9Tmr/BCn/g+sZbLYpWaCZ+n45V6zHADZad
	ICue5k50pIOEdZekSgNq/GA98JTteGcqUB8s30PoGOFsx1zagoDRQ5PjlX6M05j0G+5WnZ/n5ZY
	EOlH0NJfrneeA8L5+DpKyivwoMbvPLzxwBEBiENWj6T/qvy9jkoEceBgbNjFWqRnkHa/hmPZqnC
	MbdM44HT89NZhwinjfnzBMkAujfUAcs+LHvMQw+QGu/q/j8XroKiOMq/bZRn4RDe6h4mJF/9r09
	B0YvxEmNu50FBPp48IdvPILe3pTDL+yOlOe5mgvQKDtHE6QWdnCE+qqcjZLw5aK/qGG/3kv7cJd
	Q1N2sfLqVyN+CeEHp2rkFJwUDYM7WyvYlNAbg==
X-Received: by 2002:a05:7301:fa6:b0:369:f195:a5ff with SMTP id
 5a478bee46e88-36a4231f8e3mr30050279eec.1.1793706321075; Tue, 03 Nov 2026
 03:45:21 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004121230.373216-1-tomo@flapping.org> <20261103.180207.1243555897796693771.tomo@flapping.org>
 <0730c9d467af3897a547860d036a5591cb40905b.camel@sipsolutions.net>
In-Reply-To: <0730c9d467af3897a547860d036a5591cb40905b.camel@sipsolutions.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:45:08 +0100
X-Gm-Features: AclHuK_gmeoOoDJ8hjFrxZ2Ct739hHysvzbZePn09uV-dSGvfQoY4epHcMfdRjM
Message-ID: <CANiq72mbRR4PfPKkDRmyyAa_bqkfJocyPd6rjZQNpbz+3mPqxg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: arch/um: Fix loading Rust modules
To: Johannes Berg <johannes@sipsolutions.net>
Cc: FUJITA Tomonori <tomo@flapping.org>, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, david@davidgow.net, 
	gary@garyguo.net, linux-um@lists.infradead.org, lossin@kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:39=E2=80=AFAM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> I guess I figured with the "rust:" prefix it'd go through their tree,
> but either way during the merge window and all I wasn't really paying
> attention to UML.
>
> I'll pick it up now.

Thanks!

(Yeah, I think the title should have been `um:` or `um: rust:` or
similar. Personally, I check the list of files and the kind of change
more than anything else for deciding trees, rather than the titles;
maybe I should check those more).

Cheers,
Miguel
