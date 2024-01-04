Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E72520DDE
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jan 2024 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="XYZz2KS+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28a6cef709so40889766b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jan 2024 02:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1704365609; x=1704970409; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=13tc0pBPhD5uwpbLlXZDiNLNXAB5mfp9UzzPnCfrFY0=;
        b=XYZz2KS+KB/Tbqaf2rnNIDs84WszQwKz/IJPz+YEulncpl06HxPhSmn5LQLZXhtRvQ
         ytFqCMqlHQwst2KL0iE7Nn7UJ+5+pe3WWhKnfnmu5AG2efJ19XucA47QA5yA+AQkDWD6
         kPfSnprFdKLgerD907MRJ5Bj1MO1eYVKNq0bDZKDB9RCQEvG2KOSGahMUeKRj3XmHk/N
         Ae2v9OSy7QF2oBEBeivZka850Di+6i/+V0PBJFg2YeKfp/seY6xIfSYMQh94B2Dj0DQF
         MxRwDu7KPp4YVZ2QO90jvVlhOsWjgxTBENkAopO6oW7WuHc3iB0XatHpDRaOGw1DOr+H
         QPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704365609; x=1704970409;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13tc0pBPhD5uwpbLlXZDiNLNXAB5mfp9UzzPnCfrFY0=;
        b=TWF4aEG0wF3QXDCrFl5STl1SSJCS366jl9bEDBik0sGU8sNZuBdrFTNEZBE1ky2+TQ
         uy+Qd0fdoByI6ocwPEmzgISSU90uMGl6Bwe/fZCg1feNbILwN2b6l+ZqvdOV76Ug8q52
         7M2eFG50Mo2Syt60QCUZrEjWD0s+75tlIj6C/AKXXl6q9u0k+QU8GCh3QtW8y3zES5nl
         1DRptT1Lr7PX94muak5lnTNCl3uKwvnlFTvQ9uL9IJyKNGuJl6jcV7lDmxEJsQFSiUVj
         w5EiI/l0lOocs4d4kclMyU1uaXR/MiClqvyZKMAlMhqayM8CPeh+I+rx5br16fthUNi1
         bQbA==
X-Gm-Message-State: AOJu0YyXWgLNm6DH0rHoV2iRaJuvo1PV+qlziZhBpD8ArNHr1QF2ardc
	Zv/fROusMUXidelxP+3ivPUZ+AFBEjR2Og==
X-Google-Smtp-Source: AGHT+IE+IgC4wLkE6RYjtDFB0pWTDIUdON92Vz+dAWf4DHJtTe+XgSKKAQO0wl9qYVa0qqRnvxdpHg==
X-Received: by 2002:a17:906:44:b0:a27:4f33:96ef with SMTP id 4-20020a170906004400b00a274f3396efmr205330ejg.7.1704365608612;
        Thu, 04 Jan 2024 02:53:28 -0800 (PST)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id fp17-20020a1709069e1100b00a26b36311ecsm12644649ejc.146.2024.01.04.02.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:53:28 -0800 (PST)
References: <20231018122518.128049-1-wedsonaf@gmail.com>
 <20231018122518.128049-6-wedsonaf@gmail.com> <87sf3e5v55.fsf@metaspace.dk>
 <20240104052034.GD3964019@frogsfrogsfrogs>
User-agent: mu4e 1.10.8; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew
 Wilcox <willy@infradead.org>, Kent Overstreet <kent.overstreet@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, Wedson
 Almeida Filho <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 05/19] rust: fs: introduce `INode<T>`
Date: Thu, 04 Jan 2024 10:57:45 +0100
In-reply-to: <20240104052034.GD3964019@frogsfrogsfrogs>
Message-ID: <87ttnt4bfv.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


"Darrick J. Wong" <djwong@kernel.org> writes:

[...]

>> > +    /// Returns the super-block that owns the inode.
>> > +    pub fn super_block(&self) -> &SuperBlock<T> {
>> > +        // SAFETY: `i_sb` is immutable, and `self` is guaranteed to be valid by the existence of a
>> > +        // shared reference (&self) to it.
>> > +        unsafe { &*(*self.0.get()).i_sb.cast() }
>> > +    }
>> 
>> I think the safety comment should talk about the pointee rather than the
>> pointer? "The pointee of `i_sb` is immutable, and ..."
>
> inode::i_sb (the pointer) shouldn't be reassigned to a different
> superblock during the lifetime of the inode; but the superblock object
> itself (the pointee) is very much mutable.

Ah, I thought the comment was about why it is sound to create
`&SuperBlock`, but it is referring to why it is sound to read `i_sb`.
Perhaps the comment should state this? Perhaps it is also worth
mentioning why it is OK to construct a shared reference from this
pointer?

Best regards
Andreas
