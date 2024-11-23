Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF08748A
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 01:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732326292; cv=none; b=Ad0mt0FQwpYKInGvKgq/bdCBJDp0MAFcMLrmbiFI2D8tkkMswo53agicR5fgicdaDktNVxCirctIIEQBEgZHXVampo6txYLP8IDGtSoccYbE2XKYJZVaGZqdQ8K3lUbZqVzmYRVZTeGaUKRRaTg68PcYS+syI9dy1/nUgMn3oWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732326292; c=relaxed/simple;
	bh=TJ0g2uv+fOikKVeaJE+ufAGsb288vXYEqQmALJOQXLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcroCZNeyfZ/QSDygo1zyiimUTPMdFLMjtIhzuctF8UIiYAETTevDsotenFAtmkLXM2Kb0zowPGqKIdvs0dcg60PmZHhPyZDxsTKN2X5FVzCNMVoitInC+Sxj/TA6XnLDnm1KXfiOzoRDvbfhpsYfHTd6LltfPpUblFKckXzoVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+q2HpI3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+q2HpI3"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d027dc53ccso1757a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 17:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732326289; x=1732931089; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S3VAkynSndmVHDi0F0L9SQm1sisxlAWh9z4fRkq2KhY=;
        b=l+q2HpI3rmv14EZhGlpRHtZZ5ocQkNsQDuln++6dvJjNb/HfbnfwDigtcrQA8nVkfV
         qRo2Ix4bP6GLPmlTk9dYdpdqsvecuq1XnzzPaUfI3l5pcyEBVAiwZD5p2F9Tr4BtqQA2
         9HGl0BiiMyOadlC/dlThphN9GVaAdHSDFTUqAXD2ZfVi8DH5nTEBOOwLUjcb2J2RM36h
         s7cjuzQVC2H+U+sw1UfKZIIHglvrby8iJvSfLOZXnNnJEqhYtF4xHoGHTnI5Ad+KAe2D
         ne2agVufHfdjfEUYsj8DhittcXQnRr8uqvhljnudGt0yIX0E0k/4p9/Xhoko4K0/sfGc
         9iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732326289; x=1732931089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3VAkynSndmVHDi0F0L9SQm1sisxlAWh9z4fRkq2KhY=;
        b=OKlrr6XSvFh8wl4m0o4+BBBxHaIed4wzSgp8Ce2PoFz7JpjHdbeYLHgX6Dk2YvjBhK
         5hhBbSc3mCd3HUCzRy7IJRU96wxGoI+/h8WhdPvNGXn2cBzxUYG606dGSE+AKO4KDa2C
         sbw9rSN3ginCA1FCwUmLoBju6ZUQipMzvI81qXs4JcrFSbDgzXyC6bveSo+4fpWAXZgp
         hYuN0YvNgpbQb1imx7E3DvS0D0+/DQrqDLyRSQdAO6icZhNBkRaXY7Gvq8MmXSBrt23O
         C0U8L2xn0LOtk/uJNXcpFr7eTTDzQYW5bmViI1INDm3LF/rY4g7yktA4AZljk4hIrokJ
         1RlA==
X-Forwarded-Encrypted: i=1; AJvYcCUWnh1Bo2O/5A3VSs5Qq9GmRm0vTxn9WmgGQK6NrPtH7kdcIM5ZRGpZWE6vccEi1K9sp6Uu6vE2UIHPoPrZcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSWZXjQXrefva/6I5xkmfcFPRC/S8GnN3/44LdBfeEGivyRNx
	D83B0WZzglkPc6BAH3VENPjsMgBVoftqJFL6QDvGJnNxVLcxkrGXHWDHXsQdWr3FyTgOREu6wEw
	KE5dNdZHr0EmvXrPDxCepOZzYimt0dgu+4+S6
X-Gm-Gg: ASbGnctl593i0n8KGsFrgJrNgePaeVWgLmoFflJm9FrMNB2g7H676sQBFYHsRXQpn2N
	ao3+PvV23o0cLd/WJgq9dQLJz7BTwg5G4TVazEbL0C1NaO239chfeYL4EtXV9d+gK
X-Google-Smtp-Source: AGHT+IGL77AC2bNXg1gDSicOAbEhb3ZzKW1ZO63HPbNunVMxHMFLSIMrlQMvQthUYrEvM5iHSpLMrwWh4Y5yA5ldlD0=
X-Received: by 2002:aa7:c249:0:b0:5cf:deaf:ac2 with SMTP id
 4fb4d7f45d1cf-5d035db0d11mr37256a12.2.1732326289218; Fri, 22 Nov 2024
 17:44:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
 <20241123-extended-modversions-v9-3-bc0403f054bf@google.com> <eac20e8d-d08c-4be7-a34f-b511798f0a57@infradead.org>
In-Reply-To: <eac20e8d-d08c-4be7-a34f-b511798f0a57@infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 22 Nov 2024 17:44:37 -0800
Message-ID: <CAGSQo02-o_T7LY4Ld3EyQRyWcuryzw1YSnt=fi6CBiN4NAmYDw@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] modules: Allow extended modversions without basic MODVERSIONS
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >       depends on !COMPILE_TEST
> > +     selects BASIC_MODVERSIONS
>
> tested?  'selects' is not valid.
>

Apologies. Tested before making BASIC_MODVERSIONS default. I've fixed
this locally, and will re-test with the whole stack before resending.
