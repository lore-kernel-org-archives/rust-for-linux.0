Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A13342A95
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740249900; cv=none; b=S3O/Rb3BxhcsKt0sG050t7kx+4FiRQYKtpoAvOp5whdGvwTL85zGJ5EuVTN3PCAH1ZHm+qFtzWMrKLUJLtKzqT+zRXddGzJvQlL64Kx0KqHhkZgDld8wWOhqOLP245t36GHuBAMNKahoKqhweFvnyUkJRZKpU+Mx9Gp56FLAY88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740249900; c=relaxed/simple;
	bh=OWQ/8rNUcjck7tkRuYyqikXWKplXwhxhtLF2xDKFeXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNu0figeJjSdHGKCJpvAl3KEkkgexGJpr13GEDse1CfsJLOcVMEIPTYgnR2RPY+mYNIm2wpvGJImNs8c8bQ7QxgXkoQvA+lzbW/5xltsjxlyoOBOQtYgM/0nUpYYf2XvWqbDkG9tIxW28bGoQCF3l2wxV+h4vgkw+OYM/UDz0bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WZ9pS68U; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WZ9pS68U"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so5796655a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 10:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740249896; x=1740854696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2GmfLwYqjSfqdj0NeOV5aIVpVPfwUhlh0DRZJ2UKXos=;
        b=WZ9pS68UZoF3civ3+ZMVmUX+87KUI6lHsCGR9+jFMWJTOiQv2NN18HGhvcXxPMEfCB
         khZ1k6X9QlM7D3tTkiV1MsY/Q15WpyBXx1MbVOcSvkUN58GbuMZKsAtjDhbVZOzlvyaB
         g5X6L2REhHEtb57wYtdl2Ssks1DWCrhCnHe+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740249896; x=1740854696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GmfLwYqjSfqdj0NeOV5aIVpVPfwUhlh0DRZJ2UKXos=;
        b=ge2aydTQmx96cZ5vl6OpKM5mYTP1kjQBb2Is539S9AYuS1GJ1L7fU4t8UoWEufhNa0
         fPqPRm4nyw8nP+Q+AQcWPWGxLUxcOzcDKy4hA7mdjIJ9IzEmxExn/sCRoGDADsVc1W1V
         1NMfwv+EKiBAgAINm3mI923WzOnqhvMhSmUVEeqeJOD8POS13ZhLHK8BccMTHn6mNmid
         r6On/k7fqUhH9b+IHxZMMwTtCCrXfddHaqPVu+phYfdUpNxXbKKCftNoFIYtEioqu4lY
         529NPhokgf4AJm60cIEGOkmAHiJMDTR4+nbZ/kwt8sEJuHrDexpH9XjsBFVWCRyQGbIs
         xgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnA61a94OgCpP+CiJ/fxnyQtIH52KSg1Gpyyp+1oQbMhbsJRZRwzSl1/vaQi7HDLprGp+/aN2uPyFfoddAJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzVFhTr8PYFML4rBaSccizXaXwttg/4OBt3xx8OMgxnzabnSlf
	UY/ON6nYG0bWr7ueQm8caKhhp+lLhjMaJXBA/WuhaUILO4OEheKpYnfYXssZCSRpNpsBarSL4nL
	wpPQ=
X-Gm-Gg: ASbGncvLCmyLfZ962IL7acru7Nd0bEWfBAh/tehEzQiNwaCcaxOQpAUSYekBdeUkNr7
	Y4STQ0v/zfHyZdo7AsKeKB5NJX/jVixdPljnwSDFgS8x4DX2CP7pI9sNgIEHRfHYCJTnHeConDA
	53SH7gnqYwwAU+KnmMv2H9knEjG/oZvHTv9/rpoZ/g1FIiaG+QvZMSv4oW0C+HZZJJF5B0X7pLi
	Af68zZm47ldnV9VMhm2pFuFgU2CuvQA6xO2hG0ESIw8x8JqRJQCR8x3J01XjTKT2AGws/REUGSN
	l23rbt3C/XWr8gmQX8nHGVgYF7mdt7Sst0V9gvPZboKZsFyISiF+hnbkQGrh7Ptjkdw6rd8C9Sg
	9
X-Google-Smtp-Source: AGHT+IFc8ClBcI2NQtaslImFDEhS50ezAAz+gMCmfYasxy/MHWQJNWydIGaXjyNOB+MihVzjqjwEdA==
X-Received: by 2002:a17:907:3f8e:b0:aae:c3c1:1361 with SMTP id a640c23a62f3a-abc0de14acemr713844666b.44.1740249896404;
        Sat, 22 Feb 2025 10:44:56 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8a647c7dsm1348701066b.72.2025.02.22.10.44.55
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 10:44:55 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso546290966b.1
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 10:44:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUv4G+xJiRNNsQFjblLAZjJcexpP+plaCSz2hag2SpeF5wbWCOkXSCi3DiJ3KP/eVOd0R8lxEKtry55agKpkg==@vger.kernel.org
X-Received: by 2002:a17:907:724f:b0:ab7:9a7a:d37a with SMTP id
 a640c23a62f3a-abc0de1954emr621935366b.43.1740249895227; Sat, 22 Feb 2025
 10:44:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025022042-jot-favored-e755@gregkh> <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain> <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
 <20250221124304.5dec31b2@gandalf.local.home> <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
 <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
 <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com>
 <20250221172415.5b632ae6@gandalf.local.home> <CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
 <y75v63zqmgd3n42bprrbs2ppg32vhk2isppi6wxn7lfsdwd5sn@jm74cuwhadbj>
In-Reply-To: <y75v63zqmgd3n42bprrbs2ppg32vhk2isppi6wxn7lfsdwd5sn@jm74cuwhadbj>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Feb 2025 10:44:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjEQ7wd=iRN1Du-_fAqXgqEfCZH27PisDNPCpusv3Swxg@mail.gmail.com>
X-Gm-Features: AWEUYZkGmBfM4yXjsFNaaBKIjcw5m0UrJ9-jgNYDnIvr-gmrGabmAZy5fq4X8l8
Message-ID: <CAHk-=wjEQ7wd=iRN1Du-_fAqXgqEfCZH27PisDNPCpusv3Swxg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Martin Uecker <uecker@tugraz.at>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, David Airlie <airlied@gmail.com>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Feb 2025 at 09:53, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> Because it sounds like coming up with a different way to write range
> checks is going to be easier than coming up with pattern matching magic.

Sure. But honestly, forcing humans to write non-obvious code is almost
always the exact wrong answer.

When the basic pattern is an obvious and legible one:

        if (a < X || a > Y)

saying " use a different helper pattern for this" is the WRONG
SOLUTION. You're making the source code worse.

Make the tools better. Don't make humans jump through hoops because
the tools are spouting garbage.

               Linus
