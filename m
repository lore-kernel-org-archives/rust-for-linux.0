Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B062820BA
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095666; cv=none; b=R5VGkfnsV4EDP8Tgj7v0s1qzU61A4kEFd5Lboi2YAWBtWTQ5pikIiK21kIKh77SpBh3SNwaRQyItqK8BPGd+0Q6MAQl3ElKUUm1cMnqEMHEkMShEZuqxbrHAsxDstwijujM8YahIocjGnS6NEVW1JgDVNXq8SZbDpfEPRNWSATI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095666; c=relaxed/simple;
	bh=vvqRmzn5bsiLfDQPVMIJEqn98dYEOaVj5gPI9frgUKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjhafWT18QrZDVDJzogWIkpMUrvBStk23ElPe3+Gpi5gHTGdzdtZ+NLKJW0Htcjf0S6poZOV3nT/2TC9kfEgLxmVGnYP/TFPMjKTzFog/hiN7MT/IIw0Xpo97v2I6U+kQpYVlGMUgIUNOgB8fgp19RWxs2lPqHvcHtg7wL7lS6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kIj8EYNa; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kIj8EYNa"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a575a988f9so2432789f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 04:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753095664; x=1753700464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmY+IpkmibE+BnldzW/yUpXObRNwKpLs/0Xryp2VLPA=;
        b=kIj8EYNam8LXepRBDgJSj3+801Gr5i+Ne5Mn9YzQ6zos+RrvPGz834tJWd/1bvVqeA
         cZ+uL3p04LdhBkeojVaCB1nvbAuK5LXZGtCIjt/bSucXW8fFTem9iKrq3Klgq7l031JS
         m8pMecsz+POvIJxXmInzERk/Mz/AKT1iVgmEdrRNk0f5xk3kEop97mSkWDxRviFStMNE
         7ZRD8SoYlb4drKToRnrHZiHR+YU6MnUm+709n1wnPrLqIiEXof/PjYAGHcevXUiOK4/p
         DTLgfegP+7YeI/mfCX4VehrgqTFcGCmhBnCEelU5BSFku42uXXNKO7ZOmHzhEgLDDAEz
         LZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095664; x=1753700464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmY+IpkmibE+BnldzW/yUpXObRNwKpLs/0Xryp2VLPA=;
        b=IEDxx4m+BFr0bR0wwJTFKALxP8z/8iZ0+FYcR3P59nxjVzh8CK1WmbON2hsO3uvkoi
         hVWu/mZ8kSKP6YCT58JkQgJ2qIknyna+dBbPJSXlN+3A5MrKtOKmqnD9HGOiCDdAM/Mt
         Gqnbb1dJTQKNclWoGuPODa9Mf5noVdJBKUFLOE1AzepOyEzlSaNUURWmd7BN02Twhzyg
         p1WYLfL4+tl00lTz1UpxjjHVCCLiN8Ri67npXhnyTaK97/LzIedgG2gOyxJ2OEdyvkiO
         EdYAHgdYIAlMCYVEVqDNyE8Rdgu3uHS45hpKvOs/Pfu6lyqwmqcADfHlV/2h+OlSu8WH
         qqGw==
X-Forwarded-Encrypted: i=1; AJvYcCWi6tI3drwSdnnu9eLit6075lkhV0HVwJO8ymim8ZDaFnToOs3DlazeYUp3EGN+Q8Jy+NhljDR//zyd+59oNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyotAiB4K9LZgLbm6vtaLCITNMrLQXxiw2h6kYt3IIerVYjDhB6
	2S6gGxPJRsqHkxzQZh5z1TaWuY9sa2dsfkyEI/ANUwRuXWDnQRcIFT5dCCXn1pRagt5Ohxwpj9d
	JfYLXmNcx4mtARq1bTDle0liy9RZpFOhxJDwWH37o
X-Gm-Gg: ASbGncuyliQi8RcAYEy8CfAxisqBHzqcfwqnCc7QpJGEl3yMX2a5bQnODt6+XpvgTCl
	uii3xOSINwahzS/OiK3T1HsQVQTBZkFCRy93vPelNnaYsFw6SpDCN4lMwWvuDPieqxRu0mXqT2d
	FUwlQrRKtBLiAPR6DXRBePCeO89SYEMNWdKv9RIkIrv0qJW4xie2E7xAjsidMdFis/MXaBbBghR
	DkSZdAboV2fbfyYvClMTtzaPnNyNLnNp9hb
X-Google-Smtp-Source: AGHT+IEDEegBWf7D/JwjxXCNJSDo4l+APz+X0qs4pQdmNxde/72o3MOGn11+E/f6IP+htttyF0gaDT6zRxAPVq+4caU=
X-Received: by 2002:a05:6000:2903:b0:3a5:2cb5:6429 with SMTP id
 ffacd0b85a97d-3b61b222600mr10029667f8f.43.1753095662535; Mon, 21 Jul 2025
 04:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625051518.15255-1-boqun.feng@gmail.com> <aGKWIFVl4nwSl8SG@Mac.home>
In-Reply-To: <aGKWIFVl4nwSl8SG@Mac.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Jul 2025 13:00:49 +0200
X-Gm-Features: Ac12FXwftzBCY7VjqfRESxSmTve-JCl6P7gakKhAmACJbgq-_ANGdiID8v6daPU
Message-ID: <CAH5fLgj1C-BVAfK8Qoaxb4hV=s74-SNPUeHq9LtmQ5q8aqcd-g@mail.gmail.com>
Subject: Re: [GIT PULL] [PATCH v2 0/5] rust: Task & schedule related changes
 for v6.17
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Tamir Duberstein <tamird@gmail.com>, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Mitchell Levy <levymitchell0@gmail.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Borys Tyran <borys.tyran@protonmail.com>, 
	Christian Brauner <brauner@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:50=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Tue, Jun 24, 2025 at 10:15:13PM -0700, Boqun Feng wrote:
> > Hi Ingo & Peter,
> >
> > This is the updated version from my pull request last cycle:
> >
> > v1: https://lore.kernel.org/rust-for-linux/20250506045843.51258-1-boqun=
.feng@gmail.com/
> >
> > Please take a look, thanks!
> >
>
> Ping ;-) I forgot to add that this is a dependency for Rust version's
> read_poll_timeout(), which is a dependency to a few things:
>
> * In the `Tyr` driver:
>
>   https://lore.kernel.org/rust-for-linux/20250628.224928.6908316292615465=
21.fujita.tomonori@gmail.com/
>
> * In Nova, the gpu driver:
>
>   https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-24-ecf41ef=
99252@nvidia.com/
>
> * In the qt2025 phy driver:
>
>   https://lore.kernel.org/lkml/20250220070611.214262-9-fujita.tomonori@gm=
ail.com/
>
> Thanks!

I would love to see this land to unblock the above users. I wanted to
add that I fixed the Rust language so that it NUL-terminates these
filename strings, so Ingo's concern from the last cycle should not
apply to this version of the PR.

Thanks!
Alice
