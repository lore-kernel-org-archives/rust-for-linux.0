Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3F3DEAC0
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773230663; cv=none; b=C+kMGcczUulypMDuCRFcnqRR/5qZSzrfM/IgBQvOA+lel+kuD+3I8tpKOEWYTBNA+xzky8/o8/MwssD0OtIGLgnCLzy1L+Zn6RUNSiDj+6iVEHtY6O4nas2skcyjffVvxzSXeM4VaJ8em2bXPxZeHlWDZzHxp2eXVoedjo0/LCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773230663; c=relaxed/simple;
	bh=s5EMe7bYHKODG/rm1X+QIPDr4bQTLFjKqTjmSxuIYLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKUKPrtvDZZKr+vjdx/nN35/GWNlzaEhCDB+JtnF+NI9dgMdpZx12jK8KPSr0VbiA6EjdaK8x8vRCVsg/5lR2EoLOt8CTC01D6uy/FMxgGQSPkSmwSCy28D4oHq72H2N68YwLeEyTVNSp0o6pQQ6/Y6pq1j4aFUx4wmE2oh5284=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oJbNeSzI; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oJbNeSzI"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89a14be4733so113458466d6.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773230661; x=1773835461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s5EMe7bYHKODG/rm1X+QIPDr4bQTLFjKqTjmSxuIYLA=;
        b=oJbNeSzIwFnPHScHsQshxjdJjgN5YRgniLu4SRX713CC6CAYeQLHkIfpbljvCRRAnH
         8GCdREp96tRlupjpA0l3esjCjroz6Q5dt0kA190IMCBZe9Y6TypRzoJM5ya12V1OkVub
         EUQ+KzKHFncYXagt1P6wWI3tx3xXAcJ9nVqE0WJcPYHWyuoYrh+bRaAymwSQo3rHPIU3
         l4mxZ//9rXYowokM76ZULSkPHRFaWLXI9DeuKwC79yu3oKxE8Iq2+zzTOrCWXVjPZrH9
         CEu/YAUe//Hit+usny9ISZgFfiOdMPYNDj9YWIjqEKoVggIDs+kCLw9eATV/2xna2ACe
         /3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230661; x=1773835461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5EMe7bYHKODG/rm1X+QIPDr4bQTLFjKqTjmSxuIYLA=;
        b=cBkHuMthA2OVGCg6Ec/aZhJ40arJBYqPRf2FvFYFoh/i23AHPwKd+/rAVSFZ8vqK7P
         pwdh4Q8r2xqCi73UdVFUQajqBfgimT1xKzW6+8ZqgsS4wTOpJ+NbwMfVkrLU4NMGf/sQ
         yuZNusoxTNyf1+wgyLng0xCD2UQ8rJMAz4SZ1YcVVmKJ/agXbYelM8NuzGDQSQy8kpWj
         XVRa1UWw7EQXqr5lzMwWxswt7z0bPZIp6t3iVg+fLdopERA39nmkm7S3nHS7AOBI8fbV
         FB2Mg2GaLCBOCDday9ZKF7YrmK3SsnELZupM+jYuEUwEEPxOH20m4oxdD7uAjVCphyTA
         WxQg==
X-Forwarded-Encrypted: i=1; AJvYcCUafyNhGA5j7s463dgKbM7dhxyA+T5FyWmVCupZNRPni2pFW6kC+X1/o5m9vn9bjqab4y4ggkQTXzHN39YiaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5lHtb1jGYdA499tvikCJ9e+uaGrDIddKfiuFHqkEvYDMb+lFH
	r8VkiudZ5d4j/BalVl2qJ9v+9cXflRjpR1Rj/Ms+dXr44iFkaM0WAxaPxXVFLbNij0Y=
X-Gm-Gg: ATEYQzzxCF12NOGaoVCo5Z3EmUPFfY6Lni19cJlyTZ6VDi4J5yVDXtvdWMoZCjWkxuN
	QMIzrt7FqkCny7TryNNq5jj0BMOaugyjyN8HrWyin+xgDQBa4QBbHAmEQSumbrEPjflncUx5MpJ
	ENmjV0mMqttF1rWcatXaploWPMkgIqChnieWa+a4zsjvTsnfk52FSLBvB+48cmQ1boC8KfnqNgz
	cFRBWcszq1P0dlaF+Lgx4fCGdl6ZILNm3f58AhZGZ97NY1ffNfxI0tc534nX5FN2ZCvqQoKwI2v
	XW5TFNOxDXGAJr+tEUhMKVNO9DYYnPEWg4onnz31BeNJiiyrnrBVWb5eN5hP3fZHEzXFKTsWJfJ
	f1Oij8ZmRv5FuWGSSeu2Jd1F1J7My5VqQjQs+JSowmiA3jUUf0kn8o2ZvKyLGSiIU8VCPenLpyO
	6h57Qkuf0wniW6eQ+KpelKGK4FlcL9UsfAuhmnLnlljRz4d/a/Ch4cuMVSWiIZckVfQWEBbaJcW
	M6qdoTLVmRAajpf0Ik=
X-Received: by 2002:a05:6214:f2d:b0:899:fd8c:55c6 with SMTP id 6a1803df08f44-89a66a5858dmr29432376d6.23.1773230660563;
        Wed, 11 Mar 2026 05:04:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d17023sm12745086d6.49.2026.03.11.05.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:04:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0IIU-000000069iv-3jx0;
	Wed, 11 Mar 2026 09:04:18 -0300
Date: Wed, 11 Mar 2026 09:04:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	linux-kernel@vger.kernel.org,
	"linux-mm @ kvack . org" <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Leon Romanovsky <leon@kernel.org>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v1 16/16] mm/memory: support VM_MIXEDMAP in
 zap_special_vma_range()
Message-ID: <20260311120418.GU1687929@ziepe.ca>
References: <20260227200848.114019-1-david@kernel.org>
 <20260227200848.114019-17-david@kernel.org>
 <20260309142954.GM1687929@ziepe.ca>
 <61df6369-333c-430a-bd18-c5b1acae68ea@kernel.org>
 <abE4JYo223OxWCBQ@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abE4JYo223OxWCBQ@google.com>

On Wed, Mar 11, 2026 at 09:38:45AM +0000, Alice Ryhl wrote:
> It doesn't really make sense to have multiple binder VMAs. What happens
> with Rust Binder is that process A is receiving transactions and has the
> VMA mapped once.

IIRC the problem is the kernel doesn't guarentee singleton VMAs,
userspace can always clone them with fork or something. Did binder
solve this somehow?

Since you can't assume there is only one VMA the locking becomes a
mess to cover all the cases where userspace can trigger a VMA clone.

address space deals with this internally.

Thus, zap_special_vma_range() is extremely hard to use.

Jason
