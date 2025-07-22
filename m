Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332DA28C2AA
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753171549; cv=none; b=jfXqegI8P1h1tL0J57lyZoWDTFgaddjJWrlmeuvKhqdIga6s769a+XQh0v3oyrJssRXdqW4CwD6xLvujAx46CGv6rlAdoCRVH8EdOqTjR0aXQLnU0OhL+zj4Kl5CqLf5S3TLVDdxeT/7q4jFcYFrPPegVl6R3d3pDHozYM1gDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753171549; c=relaxed/simple;
	bh=CnMJw8qgm8jE4iaGeacCGl+54rCiaQEFHAWsMGaI+Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gs+5qN/u4j1T5XiLi0sj/4kYhJti7u+FpmJG9Y22iqHlx+Crm62rx/clgBypsP4dHKh2XiddKJWrMblrM2vDhkyI46NHZtby3xg4sZ3q7WYXc0QEK0rBYfZ8qN5rRozny+sG4hlnUkxSf2fpP2DQM5bUlCdwDoiSc2FUhJpLIPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WndJokWB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WndJokWB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-454f428038eso44275965e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 01:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753171546; x=1753776346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfjnB0RzVX1onEBaivwGgg3zlp9uwBQhMC1tQmetXyk=;
        b=WndJokWBT28u2yETPfCC7YrlyEJifav+jIGw/xBSJPHTnDNFZ+aeuTIfpXvlb5/pHO
         jZkxU6nbu5UI8HiS5qYqWMrWIqHFMrI6JKw++CChmJHqqg3QocwhEBb9NtXHkqEH7VD6
         DJEsogX32aKuVuOCk5GjLNmIc2FclSsojwP/WjXAtv1tDu51NZcH0DCWcb5VA/+jZJpJ
         LOF0HZGpnnWpFFJJ6zMnqvVsBBNd3l5lCExs6amkDLw7mYhJfqTUpBaFYpo0gYZtUaxD
         pNw+1FOFG3NycC+KotITYl/WjqY9kh9MKMwpYn0cPCrwfEJKbrSTVnoJJlvQvaalP8KW
         oKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753171546; x=1753776346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfjnB0RzVX1onEBaivwGgg3zlp9uwBQhMC1tQmetXyk=;
        b=J/WCQgwowl+1yDYOThNI/zi/A6uEE4jkA2Hx2Lx25WjzlonCrgN9/cPVUFTth+IJlh
         RB18OE05S4JyL3Zfv0OH0+diksUcA85xncCW3e+1o/KWNVIlSzrw3I375r3ycL52hZre
         3g28gqoSj7pnwnZogI8UQW8SGoCNNnqq8kYsoL+vk4pDl7CbXyjQ0emASTxI4wTIfFjH
         Wd1PcN4HSv5dSafXUN3e9AQMcY4vlXebl0+88VIPleI1R//Y3619sIVqa1UeMCF7Dsqi
         MzIudVgDTyN/4wF6v5korHd0dKhp3dsWToFaAf7mnVTNIACICH1N3hE3uIf1LLVpft4M
         uQVA==
X-Forwarded-Encrypted: i=1; AJvYcCVLGN0w1ne1SSVld1gmu3lJpQuDuPu7aGa4OWman1OmsLqWvRjMR4hzGQLFI3DUMOQmC6orUMeOXNJPfZWpWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZSfDvaHqWJhis6a1rJbV2OR6G3cFPK8bSNKgefv0DVC9AYL2Z
	zCp0MwLhmT0CCi7B0Ui1fNcE4C0OETyYXNA3x3Su1TH92DVHnLUhLYt3V0zWEAqCR0MOnLQNwww
	OxERbfp1dP+eju8nmgx4T+/qr05LXH8D9GUL0PHqN
X-Gm-Gg: ASbGncvRDKniJs3IgKVlYifMaItOqus3lbJdmCdYDFA/O9V3WSN4J4YYO3wxadG7zQx
	gCizTrV1c2jCLmJ3UW9HdxkHLDMGpWRxbvKTLGsMc2Ozjx6b8Qg4Zv7hFv6stD7p8FThJZF88D8
	LXBbctQm426UpdeMslhjYiJ5sHL+4hCK5f5pQuvvJ5w7pcg0DwcOEJl717LQe5jqdaAYdI3t3X/
	FnhQVYKep0C8Im7E+Hj/jaPL9RQFo6MswDH
X-Google-Smtp-Source: AGHT+IEw84d53XcRHbzMwCvvvMTy56CE5J7Uzvc/tFQgaHNn6AVGRHDi9rYuYRwr5tK4BOrSh62WYx6dB29oES2mpvk=
X-Received: by 2002:a05:600c:3589:b0:456:1d34:97a with SMTP id
 5b1f17b1804b1-456357faf96mr180725475e9.9.1753171546498; Tue, 22 Jul 2025
 01:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715075140.3174832-1-aliceryhl@google.com> <20250715-glotz-ungefiltert-70f4214f1dbd@brauner>
In-Reply-To: <20250715-glotz-ungefiltert-70f4214f1dbd@brauner>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Jul 2025 10:05:34 +0200
X-Gm-Features: Ac12FXzK4ugn78BVvJfIdwke3mdfyD7-O9XOG5GpvkZVg6h4YYAhyi_ttzdDW6U
Message-ID: <CAH5fLgg-yZ3C3r7psMJ7_rAC8Ep+OUMk6Kmek6u0VAB0RFnG+Q@mail.gmail.com>
Subject: Re: [PATCH v2] vfs: add Rust files to MAINTAINERS
To: Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 11:50=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
>
> On Tue, 15 Jul 2025 07:51:40 +0000, Alice Ryhl wrote:
> > These files are maintained by the VFS subsystem, thus add them to the
> > relevant MAINTAINERS entry to ensure that the maintainers are ccd on
> > relevant changes.
> >
> >
>
> Applied to the vfs-6.17.rust branch of the vfs/vfs.git tree.
> Patches in the vfs-6.17.rust branch should appear in linux-next soon.
>
> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
>
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.
>
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. If in doubt, please check the listed branch.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> branch: vfs-6.17.rust
>
> [1/1] vfs: add Rust files to MAINTAINERS
>       https://git.kernel.org/vfs/vfs/c/3ccc82e31d6a

Thanks! Just a quick follow-up on this. I also sent a patch for the
pid namespace file:
https://lore.kernel.org/rust-for-linux/20250714124637.1905722-2-aliceryhl@g=
oogle.com/

Also, I forgot to pick up Miguel's Acked-by, but I believe it applies
to v2 too, so you are welcome to include it in the commit.

Alice
