Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AECC2701B1
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 22:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750977839; cv=none; b=vDS/p6apE6w/uR4+k6kYGO3NTuAV/EWCQhQ6nh28NAfnUdObn/Xy0P1eLeidXo1d45YUUeH2oBqdpYWAOzlOr14jkHspuqOM6SC5o1y5PO/OAYwxkbOn1ln288dg7Rc0BEkl0xrc1AsYzLj4Si26dVWs9W6a4/2VHkgYimDAEXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750977839; c=relaxed/simple;
	bh=VfoblnNBGqtqqaCDzhQ9efnYRcPTy5UeogBREfnrevs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pR6TlLVJTRHmzdqbKDuDjyMUSb9KyJG2Yi4S7AheCD5aVwKtlncWPDGMBYdJ2GQNQRzmwZcAp3UU3LBrQBLZipiIn3by7IXFxabXiDWxh4j2i/C3R+xvu10tw1G+JtcnV5jn/wI7M+hXy8pohudgD8N3c+KPNj+ioG/o64UjKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=De2fRppS; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="De2fRppS"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a43972dcd7so20864021cf.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 15:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750977836; x=1751582636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=If95dr5h6255AmUKlhN6F3DaBJnLFhLX776luHKpLCQ=;
        b=De2fRppSkMJa3X9ckgBgi0ZyoiUpyun72He4022hS6robKdoPCtUcSJxRZ4uApBd+m
         wOnltqJMQcIpKaiv0OjKc8k344MHghRFHUWk0aeKHC33ZEftub/qgOhuub45ScDogUg1
         ivXxUaZ0tnW36xKfP3Krk/JRl+CT8BNRKhy0UJAH2eTr7+9B5xXdw/EIALrMRHH6ULjx
         nimljvz/oj0lEJ3KoRDe1wbq5Ta32n3wpF1LZiIpEaRAq5DnwF97s+VgnYDN76x3rYp5
         VPshWOfNromr6BEQ193jK8lfwkCHZhpv973PbB3q8UXap7a5c9Wa6ZUubzXA4+AvjDkI
         Np5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750977836; x=1751582636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=If95dr5h6255AmUKlhN6F3DaBJnLFhLX776luHKpLCQ=;
        b=Ddy3X+s7jQ+bwzBjzojP9C9uRImh+2Hybq194DCjG4AfTCMWSMgdOsklcxM5Kg2KXW
         GIFxF1Kmzog1VAfTjxsFRLYwVbboJUSAldOIC7CCXAaboEkJm1oJVRN8fRKi4LM+WPKO
         aYvsD2poF+NX5+2mjkdR7tUnzDpcv8BBr4cn8Z5o5uedrbLfLWOAhd0mwhh8jVjfcql2
         VncQApfzBlCni1/6Z7zOSs/MilY0W6URoxleSJNOHZkyaO0vVMbcOgZt4uPw5xhjiJAp
         cazGHDorI7vZRxhjB5ZJ/vzqFwaXk1KGbiQiKdg22LuVEcHK+0WPhsP88BnfTt0/4z8w
         TxQA==
X-Forwarded-Encrypted: i=1; AJvYcCWCQiClS2RUuEVaoKAzexob4Ct7LFlscZyQKXNbHrqL+4yImz0kPMEChWDnBGoKRCIoSoRoNYLrW66GKBQ3fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZkHswrltzBWeVJqICBrPhmI5wy+4vKuDqvGI4tSmWjFm4LaUu
	4UthL6pqwRDQK7MgaKDeZNQKO5DJeQhBNl73+JcAJs00kgIA5DcavakDxdGfFKZ+bdw=
X-Gm-Gg: ASbGncsMKeWg85LUKapMlbeJ5pICV6UFQVs561t1X4n+h1gKluKAV9gGGOz9bUCT3sR
	JYQFnHiqm0BLm74Mco3t4LFh6gWq1P44iC/w5+BWRCGMnHzS8KA2H5xdHk1D5j7OcyA046WzwnA
	EfhgePWdMBTaK5f+Gs3iuLpqYf5w5yrDnJSDj2XISlop8cc+oOOICuAL9PazfHZm9ajBhcCC/PE
	o8+YWLVmUyxs6bn+BZ3mZbz2zJHzCykTn99qpIAjMQRv5FqgX2uidL2SAVhCWiRtbRZr8VcAe4N
	/OFc0awPk2n0qo4lopB9pHTLzcI8WKMZbpZe
X-Google-Smtp-Source: AGHT+IFZ3zSfjYQzxyz1yM8Fepo5JqoekfbsnijfBYQsXPZ/Ajozpgkhms1b0mgB5wFz5VVdckjdGw==
X-Received: by 2002:a05:620a:6188:b0:7d4:3af3:8ef9 with SMTP id af79cd13be357-7d44394f4b7mr170906885a.19.1750977836523;
        Thu, 26 Jun 2025 15:43:56 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57c537sm4265211cf.57.2025.06.26.15.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 15:43:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uUvJz-00000001h7a-0mlm;
	Thu, 26 Jun 2025 19:43:55 -0300
Date: Thu, 26 Jun 2025 19:43:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>,
	dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
Message-ID: <20250626224355.GE213144@ziepe.ca>
References: <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
 <95ff963ddabf7c3cd2cfd07d0231a0073ff6847e.camel@redhat.com>
 <DAED5BUK7TUQ.4JRHFMWZ99W3@nvidia.com>
 <27e17dbf-df6a-48fc-a652-ad48a776f668@gmail.com>
 <DAENGORNRVZH.2KIGKFV5C5G3L@nvidia.com>
 <f787046921fd608c385dc5c559883c5d70839507.camel@redhat.com>
 <DAP96FEJ0XWT.PWYMIE8IJAVQ@nvidia.com>
 <e2677c26-1c25-4a34-b666-9dcfa9642fd1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2677c26-1c25-4a34-b666-9dcfa9642fd1@gmail.com>

On Thu, Jun 26, 2025 at 11:31:15PM +0300, Abdiel Janulgue wrote:
> Just commenting on this bit. From what I've seen, we don't actually leak
> anything. The cast only creates a reference to the original C `struct
> sg_table` object which was allocated and owned by whichever kernel subsystem
> called sg_alloc_table(). Rust doesn't even allow us to take ownership or to
> dereference the value, so this one is safe. Destructors are not called on
> those "casted" objects.

This does not seem the right kind of philosophy.

Every pointer out of the kernel APIs has some kind of implicit
lifetime contract.

Eg if you have
  b = get_b(a);

Then the lifetime of b might well be 'alive so long as a is alive'

Or if you have some function pointer callback
  void op_foo(a) {}

The lifetime of a might well be 'alive only within the function'

AFAICT rust needs to figure out these implicit rules and the compiler
needs to enforce them.

Eg

 a = make_a()
 b = get_b(a)
 destroy_a()
 do_something(b)

Should be something impossible.

Jason
