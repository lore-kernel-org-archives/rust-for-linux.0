Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912FD245033
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758214993; cv=none; b=oWRli/uWlu0vYwhfQ6b9f/pnFJPlpam7PXamBVJWpq6oe8hHWhU+yxkeScKxA+baoEGriipfOCur4HG4YnE5sphGrsn+6I0UnvOMZLNtMHM7gzycvad+BOjpMgs7Ibw4C4N435ZNpTS90IleV/gkRJj28CgzwzRLNT/2nrfq4u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758214993; c=relaxed/simple;
	bh=WqdXMGtL8w4zmU4S23uYUzbjQRhs7VBTRXB15Vt3dVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YY7vKgYx2IMv0mrHu7MmE2XFj7Ny75kHzbdZt6Jxgg5LOfDNbW1RaY42xOvKLefbiwv6b3u4wp5uQ8dojubs/Ik3zTSIa1evhKIJrji1LHph66aXnOkOj42BKw6RMaI6vbjMyEX+Djxe0QHVqiFJkjAehppznyuMX3oI3OiD1Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JmVjXXQP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JmVjXXQP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-265f460ae7bso9385ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758214992; x=1758819792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ym1RX9p3TOSmJKSmG5yfpw916lpqGnu+pp5TNhgvRs=;
        b=JmVjXXQPgMTCI//kri/rrED/j9uDHLqXDsaQa4cvxPU+IPCD2RnrA3xot/tPDAtGIn
         kzThFh2hRlvWu3SHHo6xdEwx9iCGDPkwkRNQ91914yJI9UZPVqAF66hAlkdRDo/fidHy
         8i2LKEboJxF4DNUAiO4QQu7IzNcUyFNyTNA1XnBCmm9tc/X8w1b1sAx6RmsvubxY8KRN
         3koZ1HAdCS2eYBblCF+pwILfAfB46270I4pR7pTEwSVZEAeWjM/y5KVVCXmD0VXHyE7K
         shU/pkZAQsOD650A+g8ycwAnEh+Ox1tehoJXqTJlniNEuCIP3/vaJRLbSQM/2AmNmSsS
         RSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758214992; x=1758819792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ym1RX9p3TOSmJKSmG5yfpw916lpqGnu+pp5TNhgvRs=;
        b=HyluWwpBvRyWqqajQqEHUuaIn3PxS9Y0sQl9ORYmeQY1jaAIj+uqy2dK975hAb+Z17
         iv+JsK4bBdXHJIN98f//xyJAgOwPkLKN/JxNwFLOveaCeSBlTbZOpWDC3pP3zA8hu8po
         1Ovq1EkauAUpPxcqNmMffYntI+BYYvoyYK0K6eiKKSwln0Ph5mjb6FXTmTViWtHxGR2x
         QCJ075wwjRf6XJhIDzM5LUtACObUA/X732FkZTotO4owaodmT22LViafn0q4uPijphoX
         xr0BV8xzVJFBL+r1KPviEx9tja3zbsQHRmQxbc0TA5ECHTC6xQyvvlXC0u7TtYVjnMSn
         czfw==
X-Forwarded-Encrypted: i=1; AJvYcCXYAwsCrDhz2guw6MY4sNbor6J6IHF6JY5RTChJNBKm1s2Oi1QdTQ0aK7jINcu5IXQpe+NMhdRIYaVGichhXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2nIkkak31tmOQM0Kj3sIJKqc6jQw9t7McdnZ5mpC5rT4MSDr
	HgtbujAawLAUEQYCT3tT/dAI0MLi6YtEydKNcJnZiAVbLNVDZNL0p/AKPlO3/+tpbQ==
X-Gm-Gg: ASbGncvmcPodJiz+UyGvHBx9SyAJYWbci1AExqQdeOjeMWAldhg2O0ev1/HudRePUz5
	VuSsgW7+co84OM291i4unT3M7EIQRFY8MhJmSg4N9Lb7XV/U2EquSQwXExG0p5PwTwhcau6TMCw
	JBayGzs/zO0EYldaUjI0BZ0CN9ctk2+UoWFXhKgzDDB7UjNprDqEEHsd/pESafpPaJ6TrNNw0aD
	GSgYEHZEECsqYi9yWqlBUixH8kQxaE0cmgSUmqN/PUFdIZADmlUHnENx4WVjf9Y2C2r6SHWEDkE
	PD4KcOP2WzmdnBsB88+JtFc8Mr36BZAy3AcXBRQUbjpxQs1dk97+2SCZi/NLvS8BE8vkjlXAl/o
	QUdngdsbAT8R2DztPzXQ697XnxQIvqt+Whr7dKw4CgO5UHS1eolyotcjxrn3N4TxeZz/XxnWxaS
	BlG8XqVgun4Q==
X-Google-Smtp-Source: AGHT+IFjuyi4QqLZ8qvMbqryrbOAzU3Sc3TkWOooDemgm6De8AipTLgjMlTSUGYxKpghu12Kv3bL8A==
X-Received: by 2002:a17:902:e74d:b0:269:7c50:85c8 with SMTP id d9443c01a7336-2697c5088camr7050725ad.2.1758214991379;
        Thu, 18 Sep 2025 10:03:11 -0700 (PDT)
Received: from google.com (163.180.16.34.bc.googleusercontent.com. [34.16.180.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980336511sm30783875ad.124.2025.09.18.10.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 10:03:10 -0700 (PDT)
Date: Thu, 18 Sep 2025 17:03:06 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Matt Gilbride <mattgilbride@google.com>
Subject: Re: [PATCH] rust_binder: add Rust Binder driver
Message-ID: <aMw7SmMz8CXOelix@google.com>
References: <20250918-rust-binder-v1-1-7a5559e8c6bb@google.com>
 <aMwxLQubVOuGZGLf@google.com>
 <aMw5b7aNxoULilmg@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMw5b7aNxoULilmg@google.com>

On Thu, Sep 18, 2025 at 04:55:11PM +0000, Alice Ryhl wrote:
> On Thu, Sep 18, 2025 at 04:19:57PM +0000, Carlos Llamas wrote:
> > Hmm, is there anyway to keep a single binderfs.c implementation? In this
> > case we now have separate CONFIGs we could use for the file creation
> > callback? It would be nice to keep a single binderfs source file.
> 
> It could be nice, but it's pretty non-trivial to unify them. If we do
> that, it will have to be a follow-up, and the follow-up will modify C
> Binder too.
> 

Ok, that is fine then. I can look more into this part once it lands.

Feel free to add to you next version:

Acked-by: Carlos Llamas <cmllamas@google.com>
