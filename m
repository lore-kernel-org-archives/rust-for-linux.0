Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA4551C45
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Oct 2024 03:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729566911; cv=none; b=eSwr5u+0ZGmbguwSemZUhWiL63oV1dE8XYaqQ/KYcdAEP2/YAfx2n0DGIhR4p8913en3JxP+M7TqCFXX+z+CS+LUI/q0p6dzbcj3y3sduYV0AGMO3m0D9968HQb6/VAR9hDcweyeWrFM0TkUUaMsz5h0v6v5DCkkBpVKQRi/oI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729566911; c=relaxed/simple;
	bh=mgpxw46fBBXZ0f17ax91rUacciVTXVc6J71R9qO+cPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kulss8/ah9GTnZX1+X1g0rNSVlGPQsFqubMq6GScJkr3PdLRIIeUD6CagNHJECWNK+RLz+QQsgxHcBz/o/ruAcLR3VLSzlwscN8fp8zWL+A/s6qVEuzJOYy/LKJ3mRqCxHJ5G6SQoJEnk6TIxOAix4oyPn8FykeyzxKb2vdtFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0vWn8gB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0vWn8gB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c77459558so44120805ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Oct 2024 20:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729566909; x=1730171709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a6IlvX0P0hGAzr0n3zD/8ArgHRrdAF1jmMwH3GN5pGc=;
        b=g0vWn8gBulT5fX2gGD65gHWL9EHv13A6GH0zqKqIMYwEClnv3AMCyn3V8uaPVunYdG
         5IH4lKkgzWz4XcWO03PGVmYQW/yCRVEXk2m/uNP/lLJYODDPhj4SH8g9Ayb0w/8OASxE
         TsXzcoUXs0ns3fkHEHM+3hwqjSXJJ02m4vl1q6XqLowVUTe036HNgaP0Qrqj/4o7gSf/
         L8YB1Ln9RiQZ2VFxs7R9acbWzgdFBqkBTaHZbzBQ/eGG9yDubQ+ph5BbfCAUy1u7GlHC
         0lWu7yRqlWS8YztNMhsbi5gSsd+qqpZkzAriAvAcOQRIlon5ODeT4R7EoJJcZlz8ZFdP
         /SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729566909; x=1730171709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6IlvX0P0hGAzr0n3zD/8ArgHRrdAF1jmMwH3GN5pGc=;
        b=Z3ir1n1ASntjwGPV6zOBHAfvn6aGNdWw+0Y5uy6G7OEWwfCBTxrERdJdoHvO/Q1jee
         LOxdIOH2KtBTIFGM/do/vgf4eDoHMTBf2d8dV9XXMy3NR2Tvs70rmnbK2dMYhr3ZMblp
         fKilucrLNQs8OcHISdhMtB7UuzyMXXh14X2pabEY718M+tJOJ4d1DNFDcABtqvbmtBTg
         tpWKJNemJGMSfdD0xwuN9UEjaRy5owEd7ecrddGiPPPOrhZsMQN5ahkvv6ugt4YjwFKv
         IYOAgAEirtNVBPBuLXOqRItY/wY1X2GSpsmpgShuEVFpREW1G40dtgGlTjc6s+1CDMO3
         vaiw==
X-Gm-Message-State: AOJu0YyBgwkSFWw1Wvsz2Mi0ZjcxkyZQ8kLCHnjzp5gSyH1aHnbTu7Y9
	02E2wm5X9d1yXLNHTdp1QxsoTovcBuAxMtF+q6nOveFOlb0kILBa
X-Google-Smtp-Source: AGHT+IE1v2bAW6nIRaEw2ToJygqVFXry5uCyNp7a927MBgVKkoWLa9gtJfLiiR6U0J7aQqgxsPyIVQ==
X-Received: by 2002:a17:902:cec7:b0:20c:a97d:cc5c with SMTP id d9443c01a7336-20e9487dfbemr26694125ad.6.1729566908894;
        Mon, 21 Oct 2024 20:15:08 -0700 (PDT)
Received: from ohnotp ([2001:f70:860:4100:e712:ac1a:da07:2e53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0dd4a4sm33239475ad.224.2024.10.21.20.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 20:15:08 -0700 (PDT)
Date: Tue, 22 Oct 2024 12:14:56 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>
Subject: Re: [PATCH v2] rust: kernel: fix THIS_MODULE header path in
 ThisModule doc comment
Message-ID: <ZxcYsDOhPEOqROAT@ohnotp>
References: <ZxXDZwxWgoEiIYkj@ohnotp>
 <CANiq72kg4_-dS9JExxhPnhUSAzOhd-hs_JwLfOJjptkCTpT9Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kg4_-dS9JExxhPnhUSAzOhd-hs_JwLfOJjptkCTpT9Jw@mail.gmail.com>

On 10/21, Miguel Ojeda wrote:
> Thanks Yutaro -- there is usually no need to send a new version just
> for picking up tags, maintainers will do it for you :)
> 
> (Of course, if you needed to send a new version for another reason,
> then you should pick them up).

Understood. Thanks for letting me know, Miguel!

Cheers,
Yutaro
