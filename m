Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66984313535
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770969148; cv=pass; b=AOANrHYub4uA/hIl47Un9y/cySAOPUB0ski+v0+pA9VniPFmKUobI+7zjIFDnO01R/o616hqC1DZz+9+HF1OLDOswFkTUMN6OnDW9vBkRVOotFr7vaaiIGbCreFW7U85aZomA4TG3FuiSjCH5Q2QgfC4OtMZXoII0wl7hUCbLJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770969148; c=relaxed/simple;
	bh=3htkjSJNStuqnZuVHOpjfrKoRgtS/hwo+mIpwKetU+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U70Uow9Wsx+Pd8jU1i4Jh7IYhpqKXqTSlCMsHPhuw1SdSlx0zQi7h8G+D5tmo4j0WfOK9kffLlHbJclu3ijfCYmzGH2PGznhZqRaZJ5ATeAGhvlO4k6Gd+n4l6g0i2ACLYcTGHinTNM8Jn2c8JZE9pEe0b0EygsmO/oyq5CP+8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G4JgX8ms; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G4JgX8ms"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48374014a77so2215035e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 23:52:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770969146; cv=none;
        d=google.com; s=arc-20240605;
        b=MwPsE4wwlOE/YGM87NKGXX4sckNPWh6qWkSJS4/4Dyg17SdI/BP9lrk5n7vWN2Ptfc
         n34vYtkacmUzvEMj63b4msEpF8aslF4ZF8h6JcoZMfZsef2tlFXMh6cHQDHDuUMwQn4V
         poGDjlxUwYZb/yq5TOPyU6X6+IjFl8EPnsUsfz88TTR+KfMI+L/86Ey4xuf1uen4IdO1
         TADYL5+v70Easp4RLAMTKNWrJGcEHy4OnXpFjuCogaU009JUa6bpNs22TXtnyX5XNTqI
         5Wc2At6J1+qXM8INkNNL3HlAgreh7bI8+Q7jkoiLMFSL8kLUlIpPWWAq9KzLSY88ZNY/
         zHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3htkjSJNStuqnZuVHOpjfrKoRgtS/hwo+mIpwKetU+o=;
        fh=VV/VFBbf5pmrIVvmJm1RVxpuppi/+R9cU5WRz8BpYl4=;
        b=QriVoo5WNfXRodoU55EeJJwPNqkkjz+cUHVTgad90DySweFIak0QJlx1t5Zhdq8h2j
         6wccua780TU6aqVNDWgqC//SCxhPQRy2IxvXX1zM/fo/Pz1tjfhlB+XfEVBEdmXAmPXY
         RNfBb7ItM+5f9WFZ7FIyrSi686HN6cEt8aOs+W7KFvBX3WwOFLTR/ITw8mjtX2bt9yMz
         b67XsvDmwnYlObNlsyLlb0bCMxGbscTE3LbjjSLJ+sUp39GyRgVZ+WGeTuTXrPVWRZ+F
         rlH9h7BC1sJ0fGYknK7psPoG5OzJwAtR6NmIhfCQ3RNIPE7XKXVydsCKSzJIAP6fbyvt
         ZQ7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770969146; x=1771573946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3htkjSJNStuqnZuVHOpjfrKoRgtS/hwo+mIpwKetU+o=;
        b=G4JgX8msYFY+cPXdZi7bdwP/atKaWkZHgC3nGR+PS5XJcVo8nMndaSOekZPJejSKBk
         teMB7rvLMkis9kTfrTuULg+jRb3xCMEwwjllmgOCeyz7u700DxuCkv5bq4LT9eIURZWj
         K5Fnc5jCt/5iaKF+KBuTLOfDFy4zGLWweFyPndA5ol8vP52s0JheA9Gtl3cD7oZDGn9/
         um1X6bmyNw+VEsDeXj5Z903vP5GDkembkohrWDMuaXWBpJZAHF80acGctsafM006ZC/N
         cp170Q23dSZ29ZU4aVdd1ZLxV1dP6h7z97DfPBQAH6upI3Nj1cgGv86UphlfZTlK1kBa
         LV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770969146; x=1771573946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3htkjSJNStuqnZuVHOpjfrKoRgtS/hwo+mIpwKetU+o=;
        b=NJPrOp9jHP0mBUv+017D/s6QE/VBumMQLbYW13XZTOypGwPxyibpH3CPMTGGSDG/bh
         Kk9QCUD7XHVtAYrtMshPXPT8hnvWnJjNYc5P4OnNPqZT2YvHh2wqe1b/J7M5REuncUlB
         djRe3dlrz8uwMsMoErYIv3UMYGV5XtTJ43N/YhqDwNF/GbANb7g8thzwKb3SJtWCFn3G
         QXnJtnk2eZp7prDtcl5KlMCVN6LHzfbJjE3QrED9iSiLdxo0BUOpE+L6Dpg2I8pe/wt7
         BAtRdLp+78mgz8gz0M7M4ePnaZu4P0sUStprg3+HUIA+nlt1oDdcQX1UClcAzCjLA7nJ
         ogVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFMw4sJ5Ymbb8zZDeDxbeWsIbGeA9R2apCqEEHAYPLFCBmO126B5mgaOqfPqN+5Uk4V4Wby/XoDQS0ZltHyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvGgj6bZiJorqEOytkyXDHwI+6O4QS6ABTx5VKJBFdbvofc1t
	VkuvRZFXIEh6nbPKuAJmmUjyEse1q2C3Mix97u4SJLhkN5M+AkDX9RmZXsvvAC1PC5tOwJ7NXtv
	w3CthMWtxEAWameXTX26VDi9qhsE08ATFFtU/wmaM
X-Gm-Gg: AZuq6aItWhwE2XjvzjgIJt5tGa3tXfjyVDuPqLVL0747xDEcfnLQqRgRMZgm9hHo1BO
	TWJzyxSlDOqkxHyjw0C8wq1q2053JjvdOdkq532mt+wEP2fjd5Euu33aXJq3DSaBRGYnIoOWvhm
	w1BtJuN19Rv7k/+7LDL8v9Rj075f1VW+N5rE+m7bp56XNtOMA6cCJntcQgV3/cqARq4UEnsLBca
	HLXJwUPiRD+zuxxXTzXptfqdfDmvflspIQh97kZV6p4WGB60RlrHx91lLgdakiIle4/J845k21Q
	sICf+vYzRkya1D1Cg1bJR8GiTRsHh3fHXUw7IQ==
X-Received: by 2002:a05:600c:3e87:b0:480:32da:f338 with SMTP id
 5b1f17b1804b1-48373a0f961mr13096395e9.14.1770969145396; Thu, 12 Feb 2026
 23:52:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-rust-de_thread-v2-0-7d274c4fd02e@google.com> <20260212-rust-de_thread-v2-1-7d274c4fd02e@google.com>
In-Reply-To: <20260212-rust-de_thread-v2-1-7d274c4fd02e@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Feb 2026 08:52:14 +0100
X-Gm-Features: AZwV_QgJxNomdsFzMy4DSKR5Tm1fbU_npFYTEPv5nlvC2aIUi12dDnBzDTnsNSY
Message-ID: <CAH5fLgigf7unkEhYtCY6ZjQ1rPAgRM84f3C5qn6yh+sn_Eb-7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: task: limit group_leader() to current
To: Jann Horn <jannh@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <walmeida@microsoft.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 11:12=E2=80=AFPM Jann Horn <jannh@google.com> wrote=
:
>
> (Note: This is not a bugfix, it just cleans up an incorrect assumption.)
>
> Task::group_leader() assumes that task::group_leader remains constant unt=
il
> the task refcount drops to zero.
>
> However, Linux has a special quirk where, when execve() is called by a
> thread other than the thread group leader (the main thread), de_thread()
> swaps the current thread's identity with the thread group leader's,
> making the current thread the new thread group leader.
> This means task::group_leader can't be assumed to be immutable for
> non-current tasks.
>
> For reference, you can see that accessing the ->group_leader of some rand=
om
> task requires extra caution in the prlimit64() syscall, which grabs the
> tasklist_lock and has a comment explaining that this is done to prevent
> races with de_thread().
>
> Signed-off-by: Jann Horn <jannh@google.com>

This has already been fixed:
https://lore.kernel.org/all/20260107-task-group-leader-v2-1-8fbf816f2a2f@go=
ogle.com/
