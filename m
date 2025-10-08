Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF02BD001
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759933700; cv=none; b=s/MsIregJEzwUXalg/dzPRRNoeyOfcXgmgJT5QL/JmZK8q7s82iAbR4Y7MN/xO2PZr13ixyC84rpiPFg1ZvIsYZBr50zk4XwyzjCrPMsU1xf+lFjkFndCu0xTkWZBJH4h5gt3mzrG7VEuvmoqraBvPXVsPJmbiP5wmSAgVGRDwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759933700; c=relaxed/simple;
	bh=npeNAX2mCK+rMgur8NO9qYg1axnlP5BBo0aD7CnTOqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tks0Bow2NXHXSrI1qlQEOxFLab+a28PYF+meUMV8afpWXGxg51KsVWE24WtTCLV/QlSNxvAuxvzXOdNAoBvoHt3UMcMZOZpccwlbE5ltCKI8WGPNpMvyc1HnEdkMMpwBRxA08MeyfGUKloDWzXTblsXpsIvK5wIkmgDKQLAPiGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOuYBZT1; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOuYBZT1"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-791875a9071so73520216d6.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759933698; x=1760538498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3nyMQNps0AyLL97xzttuk+phB0DdoZh7JjDzOjB4po=;
        b=nOuYBZT10rtSjCIA3eSb2fQbRuCk5nauQ44yq+9ziXhPdkvKKN3xaK1J0EqWelvcr8
         23asps50SsoDCyfXolqp1sf8M3j5tV5t0DyzDtnwxAMI86y6fSqa9LqD2TwMp2rO7lDm
         5VyhNA7K5KoRYoQh0VP6IJUE4Uua0FoKVjWs0dUtD5USmqFdNIsGaJOYudVI6OJSzaan
         z4wId0Zs8NfDp5Ab9ncZrxUGphvuiW8O8rL8N08KFB02LofKJdpfOZFNgaV+GAGIeRx2
         qMfZyYhgpQ0ZPNSibf+77xpUKdhPnrh4d91cUQ18kSQgydJIuhoazapGs2bqNejnbPd8
         +i0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759933698; x=1760538498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3nyMQNps0AyLL97xzttuk+phB0DdoZh7JjDzOjB4po=;
        b=g/eD59sVhUPo0t198Nt5XS/sfm7b5k42m5EGekOYiAJxxplcTm814mTMOpGkm4d6hb
         L71c3wvG9DcVnLGyfuswnRvarWXUfPsCSvCL8ZgnKEI0wTReXXBpEvrU7uevx+L1g6+/
         +mECf+yg30eikLj0VpnGvhj9AwqO1X0Wj19NwDzwgT4BX9GWB4BylItPq92nuueIWmNg
         4CyML9P7+uC26M1S91xZmfeQNrdAh9l/5OmjGTk8xW6YLMi4QlD3jMZSyBM4cMvDRqQb
         CUw9PpaMeGFctCKSTUo+ZLY5x+BbN8RGNFBFiTASXGC8bbKOEjFi+nfIQKH7OdTI4n6W
         z+Og==
X-Forwarded-Encrypted: i=1; AJvYcCWUusAmiAl7YsZ/iWuRok6p9RppTziXrJ/FqEXnhBO988ivgh2mwBjtDNsgaxXWnLuskmLCMBzm2Jb+mHjRSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD++e+33FCrHdNfJbCI0PLhfgl9ZEkBjkQbpATDf5fBHy5/Uxt
	RmrDc3wglwQIEbpdKXTHB+VwhqOHVsJlJeRrVVADZ5km4aJ8P5sBke/z
X-Gm-Gg: ASbGnct24NUxxyGeI7jy61rl/CAkuLCbj1W10ymu3d/RTU4ehnOMwzkpE5pN5lhYQj7
	ZbLK5bWbhaoEm6fTCtdkIXIYnPvbFA3cgc83jXTTjwmHA2JBIKLgNJF+fnUrJBsaIg7VcRfsTDs
	2Oq/IirLfT1D//2g0sbfSkHhqz+NGrkBy+VZGmTHRklSBcmO6cWLoGZpoqR/06d1hrdclXBlE/h
	cGtsTrxJxWY5NHPs6SzfB52q77M0KMHnrIGhZV6x7Qkox5BaE7LdVc+IDkBOGV1cxSq9DCkUEAQ
	vbNrXiumVpqf/nQmRJqit6XqiQV+VVKY3spFS9EYTKxF8Rz+s+A4OgAtwudJ02so8dxpajx1eKL
	LAkq63Sm2L71XQB8sBftoCEVo7npHONHEQnrMhZ+vpdE=
X-Google-Smtp-Source: AGHT+IFntZefp3Ss0mi+6jECEAXuwb7eOj/bzue7nh8gRQKVbgbOiMWHYq2oEKWHI2USmbbKcqsDDg==
X-Received: by 2002:a05:6214:2a87:b0:789:d698:d384 with SMTP id 6a1803df08f44-87b2103104bmr48809406d6.20.1759933697907;
        Wed, 08 Oct 2025 07:28:17 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878be61f6bcsm163723216d6.65.2025.10.08.07.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:28:17 -0700 (PDT)
Date: Wed, 8 Oct 2025 10:28:15 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Alistair Popple <apopple@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aOZ0_7YQw81lyMWt@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury>
 <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <DDC49ZIRX79X.2Q4KW0UY7WUF3@kernel.org>
 <faa99188-7ccb-4c7c-b705-3a207f5acd17@nvidia.com>
 <DDCFLM3P5MCC.NEBRVTU7X2G3@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDCFLM3P5MCC.NEBRVTU7X2G3@kernel.org>

On Wed, Oct 08, 2025 at 12:08:59AM +0200, Danilo Krummrich wrote:

> Regarding the bitfields for page table management: Are we
> sure that we can use raw bitfields for this?

As per my current understanding we can't. Bitfields are not suitable for
direct I/O and considered as a data storage. In the current scheme:

        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
            .set_base((dma_start >> 8) as u32)
            .write(bar, &E::ID);

we account for endianess in the .write() method, which would be a part
of register API, not bitfields.

FYI: ARM64 is in process of dropping BE, and Linus announced the end
of BE support for RISC-V:

https://lore.kernel.org/all/CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com/

Thanks,
Yury
