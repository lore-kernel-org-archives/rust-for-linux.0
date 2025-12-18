Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C77352F97
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071316; cv=none; b=LL6iakpr1K5MDzp2JFnGvjaXDV6AGHiO/iNpkzYP6JRhbCUlyqb0Y1rwnUs199t1K82dg7crrA4YHHH2u8vDhvXdgfGnk8YqKL6jlD2ElWW2Ejf1Yd6VdlRea+7HmbE9Spk4NbVGStNP5KZnh3aJkKfy8fVU8t34KBh+tCJjqh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071316; c=relaxed/simple;
	bh=D9pCvmgHfKHhclySGALmaArbCG87hbEFQbQgSN0/Iec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DidFjomXX3mbcaVZ5wSO9OdYDqCfeidWBjOSQ1Wn6Eq0bQjo8g4lWiMHIhTXYnH3O5hrTpzssma6aw+5gA9AMiKXBTEpvd/F2GyeIx/wOc7zTm2Ho7Izjq0Ii3n3HxZ/TAmxpjLmXL4NatoqjQ+Z2KHuGj4LzTVk2wKkSxt8rNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOm/XSDL; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOm/XSDL"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a367a1db0so11787686d6.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 07:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766071314; x=1766676114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTR2Xi7hPGXhBn6OmfrLXGQ7Lr6w/XZU5RKshp3nomQ=;
        b=VOm/XSDLgSWKcipIPYTfn7ipXtnJS4cZWRUcb7+jEJl97YOLEm+fVnObPeF3u6vLkG
         KMgnKzWqGiyt+kByajfcSzTbwYjIRoE+hrqFC5ncut06FPLXatdCR/btqi28xpGEQyd/
         G70XAKKfzO/UtDdFHycZlOwWKlwZHzgthlf4wGIPxQsXBSvY9WThsVbHO9SrEpgZfwDE
         Ppat/rrPkjIk6SYWvJJZKzsUfBLGDcrUGWugc7Cpz49lRx3OrlVmBb3hzsw4bxVOEfkF
         st+b1ZkIhujHSaBS6eUWOuk8s81dq3gNG721zYspFA/fCFbzkZ0WYtGKTug3dvW1jJKV
         Jikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071314; x=1766676114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oTR2Xi7hPGXhBn6OmfrLXGQ7Lr6w/XZU5RKshp3nomQ=;
        b=gl6AozZbTCEXpNlQgForPhBBzIlfi8YG1WLQDlBRxXyUqYpR3bHyXj+JH1y8eoy0Fn
         rlRaz+GcrT+xQMfN+3Z29VV14PqJly48xXwjG/y7Em6AZJ4vw/YdBGoDXybEd10rVDPl
         0WaJjbSAtS4LRccFhkfHRQJGKcTsEhBTTVosqStqTnEgjJHvJDrXZ5sLyEJElu/OkEUq
         MFOlhXWBkfpj5Qm/q5piAMpxLrUGOtngkBi3B4GQgfODpOrf/eV2aiQVEEiudXaTjWL/
         wvPUUyU6UWBXtsk3rj3yCyWjWNu8CZhnnlZEaBEy+woczXC9/qF0r+cvASqBsFBGrh1q
         Ceyw==
X-Forwarded-Encrypted: i=1; AJvYcCVSJSC87EBA2G2g+RE9xZYsYcCuSUvhhOrsTemJZhcqaKvDziZ/ZpD0j2aHjJozpwcjEQdk3EJYqQNiXEQ0wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvjILTBg09P9xfKykJTJUKC8qkxV53eUywfHA+c56ShTuhEtf
	bhatkbjY+qwPoUb1lLwjAwckyI6a8UzKk6YqoFlsch7nKqtF2dPh/avCYjmvVQcYkps=
X-Gm-Gg: AY/fxX4K9YzxwILYM2yluM2NvziheIj82B/OzgUl4vTjiefgzcku8EQITu/4B+kWO7P
	KMP5xM5SLId9BDhRaitz9HwH1lnqPzWoE3O55r7QGNDUF4KWV6bxIiMmsgjsA+dqQavPG9W37SW
	7mEdZJRKBsxph2Vc+4PDrd4YzmfWLjBM6evTx8m1jfFug/Rg8WiadZX2rmcQpUO7tVmooUE7ZdA
	THYYDgjhLryujudVfI4UTFcTbscja8CTqclx/4Y9UDtO4yZXZiDzDj60RH+UYxE6U8iGOUYiBm7
	E7ojVet8/xcdZcJLPUA4zvhcKKqNUHVKpByYcfK3GZxjKcKsl/0Zq0bX6wrkoYfcsTvDCU3fB+m
	Xz81p4889faZ0yWhbiGZHmLz241FT7KF50mRJpgxNwBu3xQSURtiLDHUT1jBP9tNguFXJR1ItNW
	s6ps2aHqOoqVfz619s8xJUFmRQUkz74CXSRlnMT0RsI9IdgBQj34F3wSITcgTccz1fWdZ4Q2vEM
	6iPsTwbXc5d8Rk=
X-Google-Smtp-Source: AGHT+IG3NHC+GiOj6SEx40esXYclg7WwHlsCmdk51qsC0RX+EU1EmgZcNjmuvg0NYvO5MmU0Sbrn2g==
X-Received: by 2002:a05:622a:411b:b0:4eb:a33d:1f45 with SMTP id d75a77b69052e-4f1d04db77dmr300106571cf.33.1766064991103;
        Thu, 18 Dec 2025 05:36:31 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f35fdba268sm14738231cf.32.2025.12.18.05.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:36:30 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 41BA5F4007F;
	Thu, 18 Dec 2025 08:36:30 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 18 Dec 2025 08:36:30 -0500
X-ME-Sender: <xms:XgNEaZZ_VI-pW0sWBoXMe01o0WhmhhblYBW9uR5pT909zGtbq4QNSw>
    <xme:XgNEaf06Sr8rFl3TOP3sPe4Oz9hRsVmbS9-0s0BrzT_VouW8mIuO6w8zXmB-k6OL_
    NTr4v58VJtLvMB_pmhFdX1yRr-ssSmkdh_RPhTJXLjUZLzEDYYQkQ>
X-ME-Received: <xmr:XgNEadBwAX9gmpRw9JWLIHN_BoFYsXqmEq0iEx6Ue8DJroaF4aGI4wMvIco7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepffeggfehledtgfehieetueehkeeifffgudekudetteeuueefheevuefgfefgfeff
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprghspghpthhrrdhgrhhouhhpnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghkphhmsehl
    ihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegsrhgruhhnvghrse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorh
    hnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:XgNEab9bYvIJ9eGirSYofe4ZzxNOp3DtfQHf5DDR9cYoKkBqB1Jo-g>
    <xmx:XgNEaYUaRilsZDXXwOvRdU6F4kdGx_oiZ0bsWxNV6l6PBD1mQw1_8g>
    <xmx:XgNEaUKY2q3Rq5PUWxiaq-8B6gvlFWk69C8DOeljIgXJxLJ-ZNGwTQ>
    <xmx:XgNEacAqYR6Cj2SfGiw3PQQzIdWIjT8VrCQs77D8Asw1O1bqArRWmQ>
    <xmx:XgNEaUETe9j077wIAkVLMVauGkNv-hTNrJsoMiMh39vTv-_YrT37Xmnh>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 08:36:29 -0500 (EST)
Date: Thu, 18 Dec 2025 22:36:27 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust: task: restrict Task::group_leader() to current
Message-ID: <aUQDW-oFv9f7gVQ1@tardis-2.local>
References: <20251218-task-group-leader-v1-1-4fb7ecd4c830@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-task-group-leader-v1-1-4fb7ecd4c830@google.com>

On Thu, Dec 18, 2025 at 09:41:00AM +0000, Alice Ryhl wrote:
> The Task::group_leader() method currently allows you to access the
> group_leader() of any task, for example one you hold a refcount to. But
> this is not safe in general since the group leader could change when a
> task exits. See for example commit a15f37a40145c ("kernel/sys.c: fix the
> racy usage of task_lock(tsk->group_leader) in sys_prlimit64() paths").
> 
> All existing users of Task::group_leader() call this method on current,
> which is guaranteed running, so there's not an actual issue in Rust code
> today. But to prevent code in the future from making this mistake,
> restrict Task::group_leader() so that it can only be called on current.
> 
> There are some other cases where accessing task->group_leader is okay.
> For example it can be safe if you hold tasklist_lock or rcu_read_lock().
> However, only supporting current->group_leader is sufficient for all
> in-tree Rust users of group_leader right now. Safe Rust functionality
> for accessing it under rcu or while holding tasklist_lock may be added
> in the future if required by any future Rust module.
> 
> Reported-by: Oleg Nesterov <oleg@redhat.com>
> Closes: https://lore.kernel.org/all/aTLnV-5jlgfk1aRK@redhat.com/
> Fixes: 313c4281bc9d ("rust: add basic `Task`")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> The rust/kernel/task.rs file has had changes land through a few
> different trees:
> 
> * Originally task.rs landed through Christian's tree together with
>   file.rs and pid_namespace.rs
> * The change to add CurrentTask landed through Andrew Morton's tree
>   together with mm.rs
> * There was a patch to mark some methods #[inline] that landed through
>   tip via Boqun.
> 

I think I took that change through tip because it has the changes to
`current()` and `raw_current()` which belong to the scheduler part of
task.

> I don't think there's a clear owner for this file, so to break ambiguity
> I'm doing to declare that this patch is intended for Andrew Morton's
> tree. Please let me know if you think a different tree is appropriate.

Make sense to me.

> ---
>  rust/kernel/task.rs | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 49fad6de06740a9b9ad80b2f4b430cc28cd134fa..9440692a3a6d0d3f908d61d51dcd377a272f6957 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -204,18 +204,6 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
>          self.0.get()
>      }
>  
> -    /// Returns the group leader of the given task.
> -    pub fn group_leader(&self) -> &Task {
> -        // SAFETY: The group leader of a task never changes after initialization, so reading this
> -        // field is not a data race.
> -        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
> -
> -        // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
> -        // and given that a task has a reference to its group leader, we know it must be valid for
> -        // the lifetime of the returned task reference.
> -        unsafe { &*ptr.cast() }
> -    }
> -
>      /// Returns the PID of the given task.
>      pub fn pid(&self) -> Pid {
>          // SAFETY: The pid of a task never changes after initialization, so reading this field is
> @@ -345,6 +333,18 @@ pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
>          // `release_task()` call.
>          Some(unsafe { PidNamespace::from_ptr(active_ns) })
>      }
> +
> +    /// Returns the group leader of the current task.
> +    pub fn group_leader(&self) -> &Task {
> +        // SAFETY: The group leader of a task never changes while the task is running, and `self`
> +        // is the current task, which is guaranteed running.
> +        let ptr = unsafe { (*self.as_ptr()).group_leader };
> +
> +        // SAFETY: `current.group_leader` stays valid for at least the duration in which `current`
> +        // is running, and the signature of this function ensures that the returned `&Task` can
> +        // only be used while `current` is still valid, thus still running.
> +        unsafe { &*ptr.cast() }
> +    }

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

>  }
>  
>  // SAFETY: The type invariants guarantee that `Task` is always refcounted.
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251218-task-group-leader-a71931ced643
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 
