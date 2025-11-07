Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1507246788
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 22:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762553049; cv=none; b=bwAsa/TGjVdl32a0jJzhnjL9YG+ub59VZ5uL6RWp1l1y6MzHH5MYX9mjLYmcNhs00ZTMN+CsZhX241BLgRQLaaXpVkGh1sClnGxddXxyvUxU7FTuzdkBLhGqtQH5OhYHBLg9rHIlQC+nanymaEPyY/Lz59Sx65dNJ3EzEMyyopU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762553049; c=relaxed/simple;
	bh=rH5NWi3glmpfoUsyrWFIS1fb1JBwFyE3VlN/OmM4ilY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+7k3/vbnt9k8nelW58wXtUz+4qw80cqOPz4QPrCyhdj1R3p4lMFt2o3AR1Wuu6nViAFZX6fJBD6u7ZcSpMN75Jfoc4sSBPK0IWIk4l9gypLcs7GT+cxXM5kOd5Qa/XZyb5M7zv2galp2PZDsxd4XmDGFVg7koqUBRmlAR3m/U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3qnRij6a; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3qnRij6a"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297e13bf404so47415ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 14:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762553047; x=1763157847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRweDbYCqtyY9POZrBGfSKktHIdUt3/r/qQ6F0Pf6Fc=;
        b=3qnRij6aVrqTjfXWzxAfEaSRm/mVfPm1PHYD0o4tb47ywS6YOFN02cOs0+wl+/HEbz
         bdeXUvuSOfZDSUJKJzHpeBsIZmgLB465rRbSsYiZQSzB+TW5s4D2vgPL+Tc2uBd7TUI2
         WGvDc0ysMOtLu+36XBI0S0Eyd70aVYhq9BmSkF0TF7EGdK9oz/X3sIFCn5EbXqoNfhCo
         S9K95ZLgMyFeJhe7Shkydso99fAWE0IArfvBW/zCxZiYSAt7hUCtTgIc8bvL7MCTcgRE
         IfOjAp3j3U0KUdHXWHfBfBt2RM/wddejwlaY1YhvjV0p71AijbYkzIbALuo+751g1qCL
         GMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762553047; x=1763157847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRweDbYCqtyY9POZrBGfSKktHIdUt3/r/qQ6F0Pf6Fc=;
        b=GOXWWyDVeqih+mWMW9aRY66bMAHhDTZHxo5DpHANKWCg85iMRpGCdy2PS2Dt+FsYsz
         vWkK5lzhuRgKxvU6FwzbnQ1auxJpfqS3QkDK3AI5dNRzyitAI7EWitDcARJn7DBpIW+8
         mpl8xh9iAfctNintZhpajuSmtZ3/bkO02/NwahVQ/DNTXb/1GsUXiCMR4C28b0Vb3DQ2
         fqnXzUBstV30IDTl6wNrpk55eC9DEhMNgue6BoLQ2QpZ7X+UC1pU59By3sy0jbIJdLOA
         4tVjHkiUXZpiGZthd0GVKX2Vq6krsOlJb5eTEz+ZW2AYHC3LWvPA8bSdgcE015QMZE9v
         onTA==
X-Forwarded-Encrypted: i=1; AJvYcCVuaoP0b+9haTjb1niNQhWP360Ryo5Z/mYzFSXsmDKm6xFF5F5AW9/5qZ5VPI2GaXirUobrlXD/c2Zj6EcHTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZT80bXoBtMiVe44Zu4xyfyNYT/P98cuwAQqrnU1GHBDF67Sq7
	v2ke29UbUHkikXEnsYFJtiNA1BZDq+uXs6XcHsD2yfuLKIS+XwR4GgbnFa2ZSSfb9Q==
X-Gm-Gg: ASbGnctyIh88hJMv+OwCztTJ3NtrPOcAURQyoKGjqOQtZT0300WJYAmbWnnxJtFhS0X
	YftpanpJ+lncAVqRMetQHU7idpP7v9IL/pCtysmG6eNugz6Vt/RP5wuuPq9+qL5t9qbxoYF4NjL
	3Qqu/HmIfSingpYx28ON4g4J+m8ya0QYtBZoDFl9TSBbhRkit1w1+4nTxDvEJ5hHU+yEzC4s/7d
	a3v8LfmCKk6cRRHpZs+UbGaQD9Qy2yy77iLn4rVZAnsVTxWlsVwD2WIPVg28JBkWw0ggvKa0hkB
	kpFsgFtDWypltnGtIuBmSqKnpuX+ialLbUEpW5DaBa8ansME7zbb2jhQ0xQNaR8pzn1zKen8PAl
	/0xo3dToVNjaMe6UClsVlwRS83BC/uuVuEs2xE8yDu9l9JHaZ1UsiFzlOpoHyTFcRgmTdtsAJE8
	yT6v1aqd5fa3zUR0MV1wtgub8iPZCCt01A6OA9KxDKLQpOAf3S97R+GcdUWw/RmRMpHcJLud2GS
	DhKDmRd6ID+A08GVEnYJRwDnw==
X-Google-Smtp-Source: AGHT+IFv2mkQSlcQS4PXvqaG+xeTcSDoHEqmlso5Xj5Eq3iLbnE3+0IuZGmN3O/yv/DGH1pt27g8qg==
X-Received: by 2002:a17:902:db09:b0:290:be4a:40d2 with SMTP id d9443c01a7336-297e7c0146cmr310255ad.13.1762553046909;
        Fri, 07 Nov 2025 14:04:06 -0800 (PST)
Received: from google.com (116.241.118.34.bc.googleusercontent.com. [34.118.241.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d0b427e1sm3437566a91.2.2025.11.07.14.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 14:04:05 -0800 (PST)
Date: Fri, 7 Nov 2025 22:04:00 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yury Norov <yury.norov@gmail.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] rust_binder: use bitmap for allocation of handles
Message-ID: <aQ5s0Ajt26javMbH@google.com>
References: <20251028-binder-bitmap-v3-0-32822d4b3207@google.com>
 <20251028-binder-bitmap-v3-5-32822d4b3207@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-binder-bitmap-v3-5-32822d4b3207@google.com>

On Tue, Oct 28, 2025 at 10:55:18AM +0000, Alice Ryhl wrote:
> To find an unused Binder handle, Rust Binder currently iterates the
> red/black tree from the beginning until it finds a gap in the keys. This
> is extremely slow.
> 
> To improve the performance, add a bitmap that keeps track of which
> indices are actually in use. This allows us to quickly find an unused
> key in the red/black tree.
> 
> This logic matches the approach used by C Binder. It was chosen
> partially because it's the most memory efficient solution.
> 
> Reviewed-by: Burak Emir <bqe@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

LGTM,

Acked-by: Carlos Llamas <cmllamas@google.com>
