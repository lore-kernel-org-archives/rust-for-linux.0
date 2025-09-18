Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB25226D18
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758203560; cv=none; b=YOHarKLAjUWJclT4kFLVAMMU+NbV+e0HyW38hDPYIljP/U+LL3AKyD2Dob8vT7eVHR5/c4QB+dHZDSB2gT7SISpSRY873FecSpkMI/dzhroC7cppLoRSKuSMqPMX8t9MvoQQWvKBQJ6P8EyTIsIX1EObMlx6rRey8QT9AiHKoPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758203560; c=relaxed/simple;
	bh=Ajn3a/yDUuSlAXJxD2sbv6WzjoXdyhQSoN9vhU4ZgXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNXfLZoT4JVZUQZTutDKNtl7TFSWgOqUkTebpgnY93orHa7svYaiFvNoblT6dDPMLPyy6oZkEH5uTVkVtamfqyA92b1ix2J7Udzxf6YSwS1ol0fgnrG+eLIGyQWP/sJX6Bd5ZKxHO3wI9899j5JhwyrlOwGrsofMcd43UeHhhls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0sl/C7d; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0sl/C7d"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-778d99112fbso11605416d6.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 06:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758203558; x=1758808358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cE/jfSCYe24SF+rre+WE2G1fWS5o331BSQb66kdw9Tw=;
        b=V0sl/C7dNoMJUnXk8v/AsoTd4LfAerJ9tptV4UR03UrnTZioj2zN9MDmWJkCjVqep8
         GIiHSbLUvoqZy7dV/otqPhUm5+pXJlZqpQWzAiWGqDDf4EBKYPh9E+pHz8gejd8lK3QO
         6txS4TdOHtcuGuhUAJk3x2aPYsoML4tlOrm16n+up5WSHUzEa1bz41pWMO0hDIw04RfQ
         ciQRbR+BUwp5gH3o4Ubhchleoy2h1SLcYHdvO/N1NXTKhGoLQ5+o+9idUWYgsIplqZ8f
         80ckPdHD5yIt69jvakvr2Kr16HPFqxOp1Rc3L0pulEWY/g/mUC9g9tiFLoddPrqTs374
         Q52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758203558; x=1758808358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE/jfSCYe24SF+rre+WE2G1fWS5o331BSQb66kdw9Tw=;
        b=n/trjq51t3S2g4L4tomlI3IDT91RS0+ayEKMkU95Rhug7CPxdQY5CFG50wmqUD/ghU
         IBHmRk0NARipCxwpHuoJSZOhXJEZma29bqXIez9gVz2z3WdnJY0J8HrSb+hEoNFUvjAR
         Q/kcnePIUktwPSyGgfjtSsK4GNXZofimm9u86t/Kg3tMZE+T6NIdphbVnGoGr5xDzu+F
         lwoS1oeNA9oKb//Ac8XD/s/DAIuSUWbqT32o+p7GxKtiZ1NOFS9Rvw6EEZ9gd0g1C9Pc
         AnILsvoNeuN1h72jDP16cKpzCdj1k3QkZzD2uDGVanUfmYvr33L0MFym0KPtgg4BUQcp
         fbrw==
X-Forwarded-Encrypted: i=1; AJvYcCXR56pyF8OY3fAtKRriZR/CKmb8JB7mWwvVIw1n/dsudUmc29EitF/mC8u5JmVSVmHfhw9cbMC12Z6lIwHodg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+uNIh9iqZk1j0JgxGlIQQsCwXUNtG9G39kV7ujZmDJi2JtsY
	e/mO2ydFRc0j5aWzILq4wEmSUDWL8o726cmn2s8D1NZI5XSIyrj8W7dv
X-Gm-Gg: ASbGncu9b4XziXmQBNLXEF+kKmGY55FA9qcqxtvjYgqPNwqEew3+/7GwaV19EElUzZq
	YkW/ag+C8VVSDdKoSOvkxOFuzszqsQRN6cQFzKZmKzcuknJmM1gqe9j1NSXBMkZcu96yX2Q3I5Z
	WVmIFsy3Kkmfhpum/XRacSVaYXpGganQBoLVTpHQP02Ra5Uxtwz6W9S9DxfZED1StQ4ja8zgWy9
	Sn9AGIgiqOmjAQ8B55tJrrog5hiYp+pAPviKEp4d2V0Fp94yHdip3xPAoFxbuA1yNK6hU6TMY1x
	737V5T7UmyFGZ2s8l8C+qrYw6pd1+VrPvOE/mt0q2xWe3o4odi37g9u8qe+FkbG1QjcJjQ5j0ZN
	0RyY8B8weQaaRQ7EDtktaLtVGzjUmL+F6BFZTE5l5KThh1rezff3qmFXhaiedpaQusIvFQiNTkU
	25s5V2+8HKb7dwrEjvCBtEkzUH9ZvWBlY=
X-Google-Smtp-Source: AGHT+IG0+wbWRL9kj9CAnFUfs7kPskW4drG3XQcDv80xqtqRIjJDglvei2+8r7mvayYyCmhK5XG5zg==
X-Received: by 2002:a05:6214:d61:b0:785:a907:967d with SMTP id 6a1803df08f44-78ece36a473mr62210306d6.41.1758203557584;
        Thu, 18 Sep 2025 06:52:37 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-79355ce7048sm13234056d6.69.2025.09.18.06.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:52:37 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 07115F40068;
	Thu, 18 Sep 2025 09:52:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 18 Sep 2025 09:52:36 -0400
X-ME-Sender: <xms:ow7MaKie56oVZXFhhaDZNmEU1iOrKavP0VQzpmbPAJm-1LxBETU0Lw>
    <xme:ow7MaJzi7CNJPjA-2vAE28QLiAj4I7V-4UyITUicsDcBy5KZtWSKzck2JQ6mPDL2X
    ht4V_PDwNP47iibXg>
X-ME-Received: <xmr:ow7MaGqbxKXfYVnIkVsjA0m4J6D-uVDVjyPcSoj61NPKxoGvBl7p-4OqA5eait0yy0KasLMC3xAiDotJq6xMa-t-7HehYDt60NMl0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegieehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefgleehteekgfduteejjeekhfejfedvieeftdfhhefggfehheeileeihfdtteeh
    feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphhhrghsthgrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhroh
    hsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:ow7MaPVc8T7eZBy2RgW9sfyPigQKRfcjyhXDf47-1LDV2oC82c34Pw>
    <xmx:ow7MaPM072-TRFZ85bgpHbLLRkyNUHsjKtKuIMbZUT6vjGxkEY2mDw>
    <xmx:ow7MaGkpDFl1mZWl7EeGd7k0ZEyKWnGWtSo-Mob6pYsTFLbXLuVYeQ>
    <xmx:ow7MaEpdTrbDMRd8hmdFBYLVuTCXbSTCi-kiw3IeU9UrqNoXN9_qhg>
    <xmx:pA7MaNnK8xCAmxYh-hPX_BlzF6o-fxbbk-FKI5-2ujJWT4JdG0vkQtHP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Sep 2025 09:52:35 -0400 (EDT)
Date: Thu, 18 Sep 2025 15:52:33 +0200
From: Boqun Feng <boqun.feng@gmail.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,	Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Lyude Paul <lyude@redhat.com>,	Mitchell Levy <levymitchell0@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
Message-ID: <aMwOoYe1xGDBg0Zv@tardis-2.local>
References: <20250918123100.124738-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918123100.124738-2-phasta@kernel.org>

On Thu, Sep 18, 2025 at 02:30:59PM +0200, Philipp Stanner wrote:
[...]
> ---
> So. ¡Hola!
> 
> This is a highly WIP RFC. It's obviously at many places not yet
> conforming very well to Rust's standards.
> 
> Nevertheless, it has progressed enough that I want to request comments
> from the community.
> 
> There are a number of TODOs in the code to which I need input.
> 
> Notably, it seems (half-)illegal to use a shared static reference to an
> Atomic, which I currently use for the dma_fence unit test / docstring

The `CHECKER` static you mean? If so, it should be a `static CHECKER`
instead of `static mut CHECKER`, also for future versions please use
LKMM (Linux Kernel Memory Model) atomics [1] instead of Rust native
atomics (you probably need to define `CHECKER` as `Atomic<i32>` because
AtomicBool is not supported by LKMM and potentially sub-optimial in some
cases).

> test. I'm willing to rework that if someone suggests how.
> (Still, shouldn't changing a global Atomic always be legal? It can race,
> of course. But that's kind of the point of an atomic)
> 
> What I want comments on the most is the design of the callbacks. I think
> it's a great opportunity to provide Rust drivers with rust-only
> callbacks, so that they don't have to bother about the C functions.
> 
> dma_fence wise, only the most basic callbacks currently get implemented.
> For Nova, AFAICS, we don't need much more than signalling fences and
> registering callbacks.
> 
> 
> Another, solvable, issue I'm having is designing the
> dma_fence_begin_signallin() abstractions. There are TODOs about that in
> the code. That should ideally be robust and not racy. So we might want
> some sort of synchronized (locked?) way for using that abstraction.
> 
> 
> Regarding the manually created spinlock of mine: I so far never need
> that spinlock anywhere in Rust and wasn't sure what's then the best way
> to pass a "raw" spinlock to C.
> 

You can use `SpinLock<()>` for this purpose, no need to add new
bindings.

[1]: https://lore.kernel.org/rust-for-linux/20250905044141.77868-1-boqun.feng@gmail.com/

Regards,
Boqun

> 
> So much from my side. Hope to hear from you.
> 
> (I've compiled and tested this with the unit test on the current -rc3)
> 
> Philipp
> ---
[...]
