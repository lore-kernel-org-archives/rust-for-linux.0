Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BED242D8E
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312457; cv=none; b=CsOsUNeTE6wRGGJ5IF1bR5un7lTBKoO6WLdKJH9UUZZzFNnzEYFExlzJQrKrnXSLtJc9OoPFg2s8TfsspCcIls5BsWDpsxhWF8MQrTWmA0OIy6uAKDth01PrspVBfYvcOMVuPPCNwumntQ/J/yIEE8xjkmhyH0BrzPEvUOSL+sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312457; c=relaxed/simple;
	bh=fkIz5c3VvVkstShK1H66lgQuGsJWH2TH8Np1JEM/A24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VztQZpLGrc6kQzez82dnAuT81a3P2xqQHh4HOGaLykMsGEMTA5U20SBGLHMsxFBpgAsvowGC4wcV5rC55Uqva3QVqfXQtZpGgy+enGRIAjL8lgU0a7wj81zqNp34jvGQqGPZ0qDLTBLqjKDLAQvapDkLc2HknboPNXxBBPTbvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aKIcXuCO; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aKIcXuCO"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso567990a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 22:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750312455; x=1750917255; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNX8x8v1rA4gsmPSGKn+LRzfhgT9AcyvzOiTf8D9D0s=;
        b=aKIcXuCOlkRKptm+3jS28zkHggMih4vYtkCEOExinKKMeSclcQzdyROq65tyxsKaXS
         Ax4oXlekiXh6RpFMB4rkhiv7t3KMeTrWrk+e6ewEFxc6ndT9sBxv8ZIoFOoqNabbItJJ
         wTZcWpQE0n4sgHO0OBwU0a/HKGsDRgdMMlmbBlt8ttfAgJARjQFr1BBVQM5n0sKzdh7K
         j7ZK6ROIvMiNl9uX1JDqqAZSU887fi6JUmuUsbuZKG0Ebv3LJDIz+pvdusK0betcuEz3
         GfLk3CAN2m92AlnVg4QhdCGkCAQE87e55lLCegf9ygtvPH5Ezriq6DNNJtj+7zz5Vej2
         L2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312455; x=1750917255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNX8x8v1rA4gsmPSGKn+LRzfhgT9AcyvzOiTf8D9D0s=;
        b=DRxljMbZOczanWtc09VN/MWXhoZUzQsVlkVkWju6Zc5vY2J/RRWcDxhEDsyw700cPE
         eQDDZI0/LLDOyIrNMkhpLLxgjnJv+0YCBPEuQHlF4Oin02g6patAEqq7vBrYH7zIViV5
         s8yXWm9TKErjg7Jc8CyFfDSxU3fIq55hZj7EFt59PwzOXu+O2UXdRzHy9sjGrNFROugu
         aQIr3C6Dg+iwGJmDVnymv/Guor5W7NRAt6GmCzn3hTubv1P9K7kMjdtay4LPRNwp3AuQ
         79wScO1cEvEXEnuML25PMj5CV9IiSzAHdiM3vyX3+Ewz6zMjdh48Wb5Md8Rt1ZP4CObf
         3egg==
X-Forwarded-Encrypted: i=1; AJvYcCUgx68BpHTTPBvKKu7MbH6+HvQiqbSQlBo0hPjF3JyHntxoC/RgFwjvGjOmokWeMv/DUJpLtAK8VVAbMzSGcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVH7lXWXKjqJVjnDyAEmpqtlYl/soSs1UWj+7Apkx0F5wsWm4h
	8XhDkc0lABkRR5oFjA45oJ8uL8/ORGfsTqoN1MxYVNvy2+crk9df3n/4Itu12SZYAUY=
X-Gm-Gg: ASbGncu0cAZpgu/YYfOW40Paz1BKunrdQU47sS64x/kmaXz9YvGpDU6e2eA7ylUUNwM
	uXdMO7aR57enTEe/HJWQEj8HyLNjDMQpNfPs5NYWPsXeK4OMFk+925OqkR3zMZM0pjKto5pNSEW
	u2bDGa3CDNrwYU7goRqi12gE8jvA3ydJpiyIhG2JSIdRJZ6bmxikZmYu5XsuTpvEIrne3IFgroW
	Xy0OeuSM9LUjJfGC1GrH97kzCXinDAoakIrMHNYMZB28/oUQqiausQFy0ign2stxFoNq0wHtWEJ
	K/jwbN+uW3nhx031nR2cZ5Bptjra9aSNNb0GpnbU7k5A7baowr3pn2knPVB8R/w=
X-Google-Smtp-Source: AGHT+IHpBy809k4j/mgtJ3pLZAei1vSVsYHbL1LodLYl1qhBrEB6gEr4Vdl8NOXI+5UF/UVojJEPMQ==
X-Received: by 2002:a05:6a21:8dc3:b0:21a:ede2:2ea3 with SMTP id adf61e73a8af0-21fbd4d2985mr27026444637.17.1750312442235;
        Wed, 18 Jun 2025 22:54:02 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b04e4sm12287505b3a.121.2025.06.18.22.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:54:01 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:23:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Benno Lossin <lossin@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Breno Leitao <leitao@debian.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, linux-mm@kvack.org,
	linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v12 1/6] rust: enable `clippy::ptr_as_ptr` lint
Message-ID: <20250619055359.tormmysgxxcper6q@vireshk-i7>
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
 <CANiq72mfjzXj0f4PKPKg7QgbOrhay4CF_+TBgScecKWO6acmyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mfjzXj0f4PKPKg7QgbOrhay4CF_+TBgScecKWO6acmyQ@mail.gmail.com>

On 18-06-25, 18:48, Miguel Ojeda wrote:
> On Sun, Jun 15, 2025 at 10:55 PM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > Apply these changes and enable the lint -- no functional change
> > intended.
> 
> We need one more for `opp` [1] -- Viresh: I can do it on apply, unless
> you disagree.

Please do. Thanks.

> diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
> index a566fc3e7dcb..bc82a85ca883 100644
> --- a/rust/kernel/opp.rs
> +++ b/rust/kernel/opp.rs
> @@ -92,7 +92,7 @@ fn to_c_str_array(names: &[CString]) ->
> Result<KVec<*const u8>> {
>      let mut list = KVec::with_capacity(names.len() + 1, GFP_KERNEL)?;
> 
>      for name in names.iter() {
> -        list.push(name.as_ptr() as _, GFP_KERNEL)?;
> +        list.push(name.as_ptr().cast(), GFP_KERNEL)?;
>      }
> 
>      list.push(ptr::null(), GFP_KERNEL)?;

For cpufreq/opp:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
