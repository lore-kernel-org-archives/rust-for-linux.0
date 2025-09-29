Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C40A17597
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759130262; cv=none; b=g/WRxhUzn8JyqtUPccl84v6IkgruE2LuOg3iBvEhz+Vx+5ezx5jXWh7iqcRL2+2ABnR+/4xMFGZnM3BtgvvigDorcwv5yCC+2g/5gz0q+R1rDVgOuGaNjSXdgNXRDVFhhTOxT8ny/RVaukIyftau+8mZdn49NQE58zyptji+bEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759130262; c=relaxed/simple;
	bh=1UONtrMtUK6yS11ONBetAASIgkCOBLj7c71vQ9l/8yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpWqPk/uM9JvOwBNVJiNFAdodt8ynXNWSyDd1NrreGjeeemCBzRlpYKJh3jJkzbPBUmp+8vXA3alx0gjIx6UECQrapxiW0mtiu+ldGTaLXnOlOM8+nEAncRKLfR9/kp05ruTnVNjGMMo7ecgkHTYgGfFP4Kou2snZeQnFTi8KY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGdYCiy3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGdYCiy3"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3702885b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759130260; x=1759735060; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=41vJGsYig9j0s4aHFjZZ4NIfyKzXW40xnJZnpcg+MSw=;
        b=UGdYCiy3WRwBz2vQ20mkgVgYtLKL+crLRn1iCihueEx5OTg+8xiIdi25+WXrQHGOUD
         MIhyvlhuzPN76eGG/+mYt0GuKqeOhTQUIqYr+gn/CjvdpoK3GHRtdp2oLXfI6EOWloEo
         85uxVjGidwPfHzFMf74IhbylJ+ZECPUIExnoY4Qd/YL6PBjM803wBglcyIHMWXJzh4lB
         FqiTINsXT21PfqeZcOTd8a7qYh+vaDywJ/eYOxIkQvExd8bBZctaNJTI1VnD7GPmi/Rg
         N24aht3WeB61zTpxQ6TuEUnB/4Aa/k/CSmMcBhMasiVSo/bRRuXaCX9WerY8d1ab4yG0
         Jvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759130260; x=1759735060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41vJGsYig9j0s4aHFjZZ4NIfyKzXW40xnJZnpcg+MSw=;
        b=ohi4x6t/3CmO3Lb5pEs4Xv9pFj9JeFiAhK7pbEKlmEqvIVCR7gIA0U6wweQOFfAkQ8
         Ue9YSgfWL3C4sgLEf6C2SkSVQYnLlImYJ25hjOoVX4vzMRmrvez+eCN5Ja9VKtIjruTq
         hbWWg52tBi4exVjthxlRegg29MVpJj6784LfOVIPx5BY4eMoAipgFVUVqDdFpqTHgsZs
         5zegxsQpPCPsP6BYp4M3Dx5CSaQx4xOr3QElwaayYHzulsI5Sy4HpxXAckGWiUz9h76F
         4fJjup2fNLFV626fD2WuJknphK2G/MjykBTcmGL4iB0V9xxxu9xZkjE9YRWY3QT6NyXU
         F0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ksDTrpdYt1SoNauazbPFeMbKLJ94zIB1ixc9cSOk80e2yRlsxBQLvEHtbQh2AkxIoywzQ5pGEesZJnPhyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl6rKxxxKY4j/kpcnHEYjVeM1kS/ATDKreuEzjvjHFn73yfv4i
	ZRdoLqCvbdC9d3RHP3eNRL466rAw5meb40EmTd5KWtglMJAfuzuF3EJIlrE4JA/spno=
X-Gm-Gg: ASbGnctp/Z5o2z8lifXqQN2htZdRhPfskjzPXZhJ27jEMID0BDZE1Owq6dFk93olA+s
	Sc2ZzsDwomvmrfWcOTf9ASTolGclgs2tH9t/8PWfLGVpj0Ti016Jbct/o7tfVMTfNrIPOZFffOy
	TxiLNDb8YTx7wOtdqifK8VPniRUd5K6HpXKAi3xlnxV3mT0jDVJXnYT9J7ZQteKiQvpusI4Fn7p
	1wUuKsutX+aCOl5N3aMXTDjvwpHqiNfx1tegPF4c2jABKWHYxjxWT4Pi/6r5wSa6Wb3NaFkAmm/
	ngjdV8f49t/sXBe3Ztj1DrnlDQ4bT9+NJuRBSh/fJnfLKKPQNpT+v0XBdom+7znQAFLGMHO8mZh
	X5NbNfaFaTc8wffjn0VVE1WvD8eaHddVyvmQ=
X-Google-Smtp-Source: AGHT+IG7dVzj7OVwB2z2s20w3z/Vil+iqfjNgNFet75tvLeZ3CVhPERBC3rci3CvPwp2drAdqpVuEQ==
X-Received: by 2002:a05:6a00:248d:b0:781:1110:f175 with SMTP id d2e1a72fcca58-7811110f459mr11198689b3a.14.1759130260198;
        Mon, 29 Sep 2025 00:17:40 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023c1867sm10412113b3a.35.2025.09.29.00.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 00:17:39 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:47:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Trevor Chan <trev@trevrosa.dev>, alex.gaynor@gmail.com,
	ojeda@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
	dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	aliceryhl@google.com, vireshk@kernel.org, nm@ti.com,
	sboyd@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, leon@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, bhelgaas@google.com,
	kwilczynski@kernel.org, jack@suse.cz
Subject: Re: [PATCH v3] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
Message-ID: <20250929071737.cyql6ucz6xtwdmiy@vireshk-i7>
References: <20250924052442.9259-1-trev@trevrosa.dev>
 <CANiq72nrn55Zz7wzwVpiNT9=kF1jJXDMEkhOfhAtKjgHMtjr=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nrn55Zz7wzwVpiNT9=kF1jJXDMEkhOfhAtKjgHMtjr=A@mail.gmail.com>

On 24-09-25, 10:31, Miguel Ojeda wrote:
> On Wed, Sep 24, 2025 at 7:24 AM Trevor Chan <trev@trevrosa.dev> wrote:
> >
> >  rust/kernel/auxiliary.rs        |  4 ++--
> >  rust/kernel/block/mq/request.rs |  4 ++--
> >  rust/kernel/cred.rs             |  4 ++--
> >  rust/kernel/device.rs           |  4 ++--
> >  rust/kernel/device/property.rs  |  4 ++--
> >  rust/kernel/drm/device.rs       |  4 ++--
> >  rust/kernel/drm/gem/mod.rs      |  4 ++--
> >  rust/kernel/fs/file.rs          |  8 ++++----
> >  rust/kernel/mm.rs               |  8 ++++----
> >  rust/kernel/mm/mmput_async.rs   |  4 ++--
> >  rust/kernel/opp.rs              |  4 ++--
> >  rust/kernel/pci.rs              |  4 ++--
> >  rust/kernel/pid_namespace.rs    |  4 ++--
> >  rust/kernel/platform.rs         |  4 ++--
> >  rust/kernel/task.rs             |  4 ++--
> 
> Acked-by's from maintainers appreciated!

I (and Alice) already Acked the V2 version. Trevor, please add the
already collected tags in the newer versions.

-- 
viresh
