Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA24A348463
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770989910; cv=pass; b=NpTxHIglpBSE3GRlHDhAnw14zbwRQ5uyrt4dSnq9bqQuK+fLBIxMQz7q1My+k8LniBzWTMmwgsYDp1vSUgjN1ni6T8GEVoFVQgq3mYpiZtyBkNzOg3lZdOKT0P8ECFsOsyC23ugFJOhUO79gz+UyIC4pCrnqzOs4C1/iZiptdME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770989910; c=relaxed/simple;
	bh=OPJQhLiUs8rM5OsMPuJQP7ZY92BHQElnsKfDbDP3BbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXwPyd1wKSmnQmrlDEWcAdN4mxxGLDduoGOf2EEyPRs1Lk4sE7Uc0/2RUmLJxTPm2Tw6BG9JmqMm/gU95FQySXd+y0cFJNb0FDd3gjK9jKWT8c4NIePsEQj0GRjdrABgmP+oyJOeuaAH9xDbD0+XbcfziY6anEj6rvK8+nhr3Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wF31kkOc; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wF31kkOc"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65a38c42037so8282a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 05:38:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770989906; cv=none;
        d=google.com; s=arc-20240605;
        b=HSggJTq/H6EmnHElu6cxxtwVF5M0FFyFlELyRUbjdyIn/F4j1Hto3RbkpZCSCHj4bh
         OkMmg5DGelP7Mu4kNypf6ZLdtjiyE46Vg3AG85yubZEmyLrwz8T7q9nApqdp7pMJXLCy
         Av1Imjw5fuz6oyIUHNg9aI73VRFLll7Ud3ZiI7HpC+hFfMsqzzCzU4LlEFdDXfORhXgl
         7kBUnAZKNjMyPh2Rz8wUEP7CQ5FBIrxb8JcbZg6HIpF3I5c1LRZiwTCsn6VyNGC9ofOX
         qtDu0YCAr2FiZbZsPIlPfh4A5t1SrQtBMidwC7P+Mx9jTtOXighNtwO08TljqtGXzcGC
         zDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OPJQhLiUs8rM5OsMPuJQP7ZY92BHQElnsKfDbDP3BbM=;
        fh=CDesHRrxgFQ7ny1sP+ptppUsogf1PnqNRxWGz0Dbaq0=;
        b=ef9yPADhbbpe4I+h3Da1UlpeclJwltObSlFAAQtTCKRwzbsRAmovUsi5LZljg9KJnU
         fjeSgKJGMd6KbggdxzSPmGRgrrk276K1K8bx5sJYHoTErGmfzeRQrvDnR/imbZJK/JaI
         JUHwl025VxhpFZBuvb6oej7RiMX5Y7/+f+yRLd7HCzizxRDuDrMV2woyB5sAoRncIUVg
         LOXKgZHpJPk4i3DcAhIaksYd6XLI9gruivJlHcPAhTnMgS/Lwnq12yqANCREU6FcpbK+
         C5T8Fw9T6zILEPN99F9wOzytgSTWqbpbdMp45BeVJbZaIu80cJ+SS4nZjxE2Yn55E/Rr
         PkAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770989906; x=1771594706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPJQhLiUs8rM5OsMPuJQP7ZY92BHQElnsKfDbDP3BbM=;
        b=wF31kkOcO+fKJGyKoM7k9Ut/F3Dx7dwI1Oug6EyxfghUEM2myCdQEVInr3gJfb8xg8
         sBKgkKBvgQckifqCYsJ0JMAryg+lFPWJeR66/ouqTQt+DlfTAQI5I2V5SS/eUVinHw1Y
         wwlHJ4Swp6pF69ttMlugTANO394lWZMYh0IP61LKqE9q8TAUX8yjLpECzj8EkmNFV/L2
         y3swIB6wvRbmWMIke7eyIXY0rns3G60XqOwz8ZibS0ShSHlKLxT1Zlz6PPm+A8zOwCyc
         UuB2ds2KbltPgxgZvQWj9egbhZIejxsRQpKZ0rZhNwlgllpYL/PM4q4mXNenTxG+5QIb
         +XMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770989906; x=1771594706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OPJQhLiUs8rM5OsMPuJQP7ZY92BHQElnsKfDbDP3BbM=;
        b=qE7ES/MOcpwR2Era/+cYUUMd+9D+kIho15IjJcZVnIuyNYOjRI7EbYfNgfySLUGs47
         y8fq7FdomCmz3/PUNrw0tbtV6JDguuvYe6lQsco+98aUWBRie86TtLBsW06IhCwf86K4
         gbZGGpmyZKuf7xoN96MdVe3LqvGq10I8DgpmfMbJYO+O+Aux3dknPl60GwUPPO3lMkEk
         mIT2uRZ0B6EmWV7arXdV7rzEEEMW+cyYgncqUmftSyXaOMZ/kjoyUExfR+Q0xtWSbG+X
         lMJdg11rr2U9Rvnof2MG9DVEkiO0+YBri+6//CMpZDaVy5bvq1BFN/jI5WkNRzCsDSoo
         mslA==
X-Forwarded-Encrypted: i=1; AJvYcCWfouAjUCFPm8wOTWVYKiOP6asApkliZTF/aemD8qSc1ybJkrlQnlXgAeE2DvCb2TbvKXl5J+N7R1KuXn4vZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaM8t7HerdRpSDeUi/Ukf7H6u7CcTisDKJpyec+Fg2PW0F8Izf
	DU269sZ7eCvUo6ks3kmrzxxts0R12qw1+zAC7EbpU1omOmbpd8Mm+au9RvcBqWT1dlbxVelNpwC
	1DBWoy/XRplau0xpLsFQkDRrNTUnjMOES3fl9uGkN
X-Gm-Gg: AZuq6aJuoPgV3UH0sXvS4heiZl1wQGtzgS9WW31afIB6lOu1CRUVfmWulPhidRIwEkO
	/TlYU7s7p2/2dIo5a2OH4+/9jFW7gygd5ZBiPil3cciNh4IkAwwgUdmi2s2RVzPpgxZycDMAMfh
	AI+QUnKlkuQhNXbnr1Wy5+RlV4jkP/qR0QlbdZ1xPX7PTbaYmf/XtuFKOnas1UPJ4oFNixr0/WF
	Fhg3v+P5qoNcU1P9uwwebQz6BTbFlhnGrX//0aWDnPNsHJONzuBHhSUUiI/Sv/4rLIKhEeYIK1w
	994QEhQ6e1PzZowBgPpu0H/W6j6O1LF5HcRoMQ==
X-Received: by 2002:aa7:c6ca:0:b0:64b:2faa:d4e8 with SMTP id
 4fb4d7f45d1cf-65bb071e49dmr18280a12.1.1770989905553; Fri, 13 Feb 2026
 05:38:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-rust-de_thread-v2-0-7d274c4fd02e@google.com>
 <20260212-rust-de_thread-v2-1-7d274c4fd02e@google.com> <CAH5fLgigf7unkEhYtCY6ZjQ1rPAgRM84f3C5qn6yh+sn_Eb-7w@mail.gmail.com>
In-Reply-To: <CAH5fLgigf7unkEhYtCY6ZjQ1rPAgRM84f3C5qn6yh+sn_Eb-7w@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 13 Feb 2026 14:37:49 +0100
X-Gm-Features: AZwV_Qj3ByfSZkEYGrJxCpgoRjzTs77iqYSAmWAkdRSEr8hnZzvc4SVFRiFiMgg
Message-ID: <CAG48ez1w4cubhtw=djNQvMWxdKo_d45Rfk8sW0fFHBi5bvLuKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: task: limit group_leader() to current
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <walmeida@microsoft.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 8:52=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Thu, Feb 12, 2026 at 11:12=E2=80=AFPM Jann Horn <jannh@google.com> wro=
te:
> >
> > (Note: This is not a bugfix, it just cleans up an incorrect assumption.=
)
> >
> > Task::group_leader() assumes that task::group_leader remains constant u=
ntil
> > the task refcount drops to zero.
> >
> > However, Linux has a special quirk where, when execve() is called by a
> > thread other than the thread group leader (the main thread), de_thread(=
)
> > swaps the current thread's identity with the thread group leader's,
> > making the current thread the new thread group leader.
> > This means task::group_leader can't be assumed to be immutable for
> > non-current tasks.
> >
> > For reference, you can see that accessing the ->group_leader of some ra=
ndom
> > task requires extra caution in the prlimit64() syscall, which grabs the
> > tasklist_lock and has a comment explaining that this is done to prevent
> > races with de_thread().
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
>
> This has already been fixed:
> https://lore.kernel.org/all/20260107-task-group-leader-v2-1-8fbf816f2a2f@=
google.com/

Ah, and I didn't notice it because it was in the mm tree while I was
looking at the rust tree. Sorry for the duplicate patch.
