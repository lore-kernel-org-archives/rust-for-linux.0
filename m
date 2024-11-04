Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526641C32E2
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 22:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730758837; cv=none; b=RdFO8K9w4afeSuRvtOOdcudoBFq/eLf0iM6xj0TlQdyLXTRTSwPyR5TrcpPKmXX6qOBjxFxW2YabjbFT9GUeaRm29ggmGZ8yitdP4hOUxUmgxPk4gI/frtUGjjo36zLBV015XM1F4qdDtjE63AP8+JwdgJpwQ8oGV1q5ert52Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730758837; c=relaxed/simple;
	bh=wOt7t/8sMAgSI9ElnsNuPC8fNf/VNstqxoRnvj5FM3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHeJCytaE75zSlrFKbYRwSSE4IuGTmj0OUseWFFK/UtsbdS02qHix8M5RKTUtHp3/Wg9axmawTt2JA0lAIDnRfIVqqW8cbfOUUvv7MJnMcRw10EhXTsG2JwqFC+wv51xsXndVIV1XvdxaaOAxSSbpTLXqMOsaGncEJxNaPUCO5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWUPGoAu; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWUPGoAu"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-460b2e4c50fso34019241cf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Nov 2024 14:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730758835; x=1731363635; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=phScqf4D/d54fySjQekcubFd9RWdf0+NzrN1jJmrde0=;
        b=ZWUPGoAucmPb8mtHKdzG6AS4M/XIco+oJv9l9czKYpMj2dLH67zhVRd+5oSxFBjxOT
         4/y1FsJcZs+0+Boy0qVyUbh4nMekHK1cdKrG2xGd4m73Tz9NYdd9xIalvUWZPn1coluD
         CMsdeK/+2kcrCgHRngFXOWgsADqcOsR2txkv3HsQfk1QRsTJgu1++PaINH09Ppo7r6Je
         IH82GZSIDUF9lB4oRDSRq29X0lj83aEWlSg04D2+NsOvDcjwdJCmcv8BXF439W4i6rw7
         g3/IcAFux5wb9oUMp03s0ez4KXxaf3aDJIvA/CEjfBl3exNdZHLwl5cKYiWlOBhySkaV
         1XwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730758835; x=1731363635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phScqf4D/d54fySjQekcubFd9RWdf0+NzrN1jJmrde0=;
        b=Gtlkjtu8hD+Hdw2a6JAbVxKyS4WRLtMO2v2IfZqevT/87KsgPB9TPso2uqdnd42n8Z
         hg7r6+uBZXq3cICVtaUV8EkDT0V3UAjxf0pY/5zMjsDe65zWqzXOBd//RJFpGFasBeMN
         Zx7Im5/iTUlqeLK4lqVQp+KSXW4d7QscJwuSAm4AAgCywt55TYfFGXlxcEIsJ0lU98DE
         ZCiqJL7ZPrS8dwCGhcTbTVdr5kJ2gdfj/l/rIji1IvcmKmf8FS4JVozfdwmajAhgHrSS
         BcWaR9qEdcegr2YhhXTmwb99+nr5/tG+JA7FBedSjH1kGAwgsWzrhfoHQJLz51qbdosA
         fnJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx7ey9KHulp/1/A/RhiB3Lrqxth2xunkQCRXx1BO5FpDmybWvtHkE2uMj13mKa9BWpu6RwN9xe8Ufh6EVlIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIPXnXTp4dyFDy5e7LMSrfjilLeey85sG9j6fS2ecdy9EQRrVG
	ky7vYsoVkxST9JoVSzqMMDnpPv4d7NaKZm0ySWRQ4OMJ9Lc53xCP
X-Google-Smtp-Source: AGHT+IH2qda2pdopbOOx00xQyTMdEq1IuosWeGziqmtpZLNBzF8JcSN0gTgsXXUiTCdL9c2QEOZL/A==
X-Received: by 2002:ac8:5806:0:b0:460:c2f3:9017 with SMTP id d75a77b69052e-4613bff0d8emr540908011cf.17.1730758833904;
        Mon, 04 Nov 2024 14:20:33 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad0b0d04sm51806881cf.36.2024.11.04.14.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 14:20:33 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id EF7A91200066;
	Mon,  4 Nov 2024 17:20:32 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 04 Nov 2024 17:20:32 -0500
X-ME-Sender: <xms:sEgpZ0ZJkcR806ZERBTbAkleIAM1D3MCk6mNOvFq3W-c4pphHpinfg>
    <xme:sEgpZ_YyL8IjeES-50C_GyDplQZ97bimEyAg6d7ls2zlQXxoOv9jTlUJnXtPknp0P
    zRXefQCsHbM4q1Keg>
X-ME-Received: <xmr:sEgpZ-8OClxvQpbFHZGmKpVyHzr-WJzawxV-RS83iAM_ky86DTYQZHnHZLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeliedgudehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeevgffhueevkedutefgveduuedujeefledt
    hffgheegkeekiefgudekhffggeelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudefpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehjvghnshdrkhhorhhinhhthhesthhuth
    grrdhiohdprhgtphhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrg
    hilhdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    ghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesph
    hrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehp
    rhhothhonhdrmhgv
X-ME-Proxy: <xmx:sEgpZ-qB6oQ9eP6JvwarHi61_mQw3x4DNbmRPQch4CIXhdeDqoiizw>
    <xmx:sEgpZ_pQjTSaizrRUCFeqXcK4OvWhop8rHu1Fb1TCykfmNeTDdCR5w>
    <xmx:sEgpZ8SySkqTS8rspiTZbFPZsVKYIyU2PfSbIKER5ECbY4zIbYK61A>
    <xmx:sEgpZ_rGt_UULnCItn3D-jPMn3acVqSDsyzOprXO1lZFIquBSLRuBg>
    <xmx:sEgpZ04hLf_xfJ4u9CYD1R2ldA2rQ-tjqfb-qylaj3w4Mr4Ih53mZfyr>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Nov 2024 17:20:32 -0500 (EST)
Date: Mon, 4 Nov 2024 14:20:31 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary <gary@garyguo.net>, Bjorn3 Gh <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	A Hindborg <a.hindborg@kernel.org>,
	Aliceryhl <aliceryhl@google.com>, Tmgross <tmgross@umich.edu>
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
Message-ID: <ZylIr69GP-qymLyz@Boquns-Mac-mini.local>
References: <20241103030530.76756-1-fujita.tomonori@gmail.com>
 <CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com>
 <20241104.110803.2105992905862489345.fujita.tomonori@gmail.com>
 <CANiq72nNMM5hCMa=hDbvpX6AVR5L2pswdQJ3AN05ynHx2Z3Q0w@mail.gmail.com>
 <OAtDBYR--B-9@tuta.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OAtDBYR--B-9@tuta.io>

On Mon, Nov 04, 2024 at 11:08:21PM +0100, jens.korinth@tuta.io wrote:
> Nov 4, 2024, 16:45 by miguel.ojeda.sandonis@gmail.com:
> 
> > On Mon, Nov 4, 2024 at 3:08 AM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> >
> >>
> >> The code to execute only once is very basic code like the kind found
> >> in textbooks? I think that his focus is on optimizing that code. Once
> >> the the basic code is merged, it's easier to send patches to optimize
> >> it.
> >>
> >
> > It doesn't matter that it is "very basic code". This was discussed 2
> > weeks ago in Zulip. Most importantly, it was a new contributor to the
> > kernel that was working on it (as far as I know).
> >
> > The issue is that sending code without any indication about the
> > discussion, without Cc'ing the author, and so on, is the sort of thing
> > that can annoy people. And if they are new contributors, it can drive
> > them away.
> >
> > We need to be careful about this.
> >
> I think you both make good points. Fujita, you're right - it is very
> basic code with little technical complexity, so it may not be worth
> overthinking. At the same time, I really appreciate you including me

I wouldn't call it (adding an extra load() before xchg()) "overthinking"
;-), because we are working in kernel, and we care about performance. We
actually use that pattern everywhere in the kernel. So thank you for
your work on this, the implementation and the benchmarking.

Regards,
Boqun

> in this conversation and acknowledging my contribution, Miguel;
> communities can be quite sensitive, and sometimes, attention to the
> small details really does make a difference. Perhaps we could simply
> add a "Suggested-by" or "Co-developed-by" acknowledgment and move
> forward?
> 
> FWIW, my motivation to look into it was the TODO kernel/error.rs:123.
> Might be a good first place to use the new macros.
> 
> Jens
