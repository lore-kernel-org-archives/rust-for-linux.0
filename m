Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544471384B8
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711550983; cv=none; b=s4PfVhwyuabqaACt7Ao5COFGeN/cfKThrcH33bRQETkYgzQbAxKrcCXFuAwh0WypecxodoiF1sreTVOBEUFZLwoZc/ki8Oxe8v+oKv5SkAt4pVX28lXA/KZBGlEJwNzlYPLN2Er8Nkxigh/75hUDb4YKgbJYDBHiGrwg7cvWlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711550983; c=relaxed/simple;
	bh=YnWD4qe8nKwyqN2vBn4tIVS/c5domn3aOcettabt+ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=D10CnqsuHnCr9JzRP6clHW+8x6jDPg5zaIbL+7D5ZA7PInmYvSifGmQvCUjFz+lbiXYyRCdHcIQ3JufNFRL3G/yxLNFpIdmUEjg0N6045IZFP2V03DKnwhbqb8nbpvgHLidmhkawumyTekBpZ8HSJIU+0Z0m8q9yGezr0dsvEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ezIIoQEY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ezIIoQEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711550980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8idY4tnyFfpBvQ/io2t3P6xDJH8JBwIA7PqgAqTfytE=;
	b=ezIIoQEYmKczxBItqrcQf61bO+CgZTCL91TdWPLgEg5CRvUZlaQAnULqMac/aN+3emOsBe
	sRYDbDD6efsxPzFLPXWJjeb4wtGX0uDneSNsPnR3BGHssMgHEhUiylzZrGyd9Xy75e04Sr
	GEJc1JBibayrOOATyuowxiqq31oMSPQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-YdGUmhoAN0Gdu7h1xVAetg-1; Wed, 27 Mar 2024 10:49:38 -0400
X-MC-Unique: YdGUmhoAN0Gdu7h1xVAetg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40e4478a3afso5732005e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 07:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550977; x=1712155777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8idY4tnyFfpBvQ/io2t3P6xDJH8JBwIA7PqgAqTfytE=;
        b=rdaQgGjvEK7JDEcHUFWjjwF8qfcLfr4oYQqZASCxpxyGSQ1HxnSKKoLmhwR5XsE4Xk
         23iEyqBuQ/NCcqQpQL6PZ4v/N8+8YfV9ueLgnDsxfYhCHzIXI8USk4Knh8Ti9f0eaxQe
         WZk1IDBeUCNhCYiwrSUTxHpRgXLMerH/WJ7Z7imcKZ1q6acYQ+TovYxefs7/xw5aiShY
         PBIdOwEZJHRLpyScBOsyB576jgmbgIu2TI+3CFp2MLMdD+RJvHM76lY4ncqTMrfs+TyU
         BgFUx1rXqtystPHa4mNinqBwGRbxfzaQcF5TkR182WD1Y9MC5/crkoFPi3q/LsRtJrJE
         R0zA==
X-Forwarded-Encrypted: i=1; AJvYcCWsgn4cx1zjeN8pM8xYpu7oJmIQhuvWuxs/3SmXqnwO8qleiSE2eMPS/PPgtf5aGBJKNRJATakaREjMwyVN/r1fltmfcTH2xGsKjJzewnk=
X-Gm-Message-State: AOJu0YyUJd1XYGprmJko6dqormOBe1YuoPCZHhwxP69Rql+Ru1BGtv0w
	FHYsRZUGXfGCWpOK9sjOd3UVVdL/t6EtebbS66yEodYCC0bt5SmM6aS7elikWUM9mdSptWKPEFZ
	4jz0Mdh/SEuuWwv/hP7fLQBNLpizIM0UJJp9ao00pr2R1x9Ndjlu4RJ8OGo2jJLt+
X-Received: by 2002:a05:600c:4746:b0:414:927d:60db with SMTP id w6-20020a05600c474600b00414927d60dbmr2429307wmo.17.1711550977427;
        Wed, 27 Mar 2024 07:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZj7FHfd3sxNFj3CJ1ejm8hsXuWeoxxUMppTNDnImZ+h203hOk1igsKFyRb0kli9p/Zh5NIQ==
X-Received: by 2002:a05:600c:4746:b0:414:927d:60db with SMTP id w6-20020a05600c474600b00414927d60dbmr2429289wmo.17.1711550976998;
        Wed, 27 Mar 2024 07:49:36 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id bg34-20020a05600c3ca200b004148cd4d484sm2392203wmb.9.2024.03.27.07.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:49:36 -0700 (PDT)
Date: Wed, 27 Mar 2024 15:49:34 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH v7 0/8] [RFC] Rust device / driver abstractions
Message-ID: <ZgQx_rjWrelMGm04@pollux>
References: <20240325174743.95542-1-dakr@redhat.com>
 <CANeycqq=qETyG5ZwmKo0-iLehWeGVf_WqLf=OK3D1LN2yzYbCg@mail.gmail.com>
 <ZgQCF3jp73n4BTs4@pollux>
 <CANiq72=s576RhVFCK0+BHSY7Z7gsef9ddh586zrEDhQSoXAXwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANiq72=s576RhVFCK0+BHSY7Z7gsef9ddh586zrEDhQSoXAXwA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 27, 2024 at 02:31:16PM +0100, Miguel Ojeda wrote:
> On Wed, Mar 27, 2024 at 12:25 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > In [2] I was asking about the preferred way to get some immediate discussions
> > going. When I proposed to send links to the corresponding branches to the
> > mailing list or send a patch series (for rust-device I ended up doing both) I
> > did not hear any contradiction.
> 
> Sending patch series directly is something you/Philipp proposed. And
> that is fine -- nobody can tell you to not send patches. But, from
> experience, we know sometimes it is best to get in the same page
> and/or room.
> 
> I specifically suggested reporting your progress in Zulip and/or the
> mailing lists for that reason, and because lifting code from other
> places like `rust` generally requires revisiting it first like Wedson
> mentioned.

Sorry, I wasn't aware that you prefer to have some extra process / stage of
revisiting / reviewing of existing patches / code that is picked up from
R4L/rust.

Maybe it would have been good to give me this pointer when I asked: "how (and
where) to get specific code discussed." [1]

Maybe I'm also misunderstanding what you mean by "revisiting".

Anyway, how can we proceed? Can we just continue with this series and improve
things by further review? Do you prefer to approach it differently?

> 
> In addition, we always suggest pinging directly the original authors
> too before submitting patches from them, to avoid this kind of thing.

As already mentioned, fully agree.

> 
> Moreover, I would recommend tagging more prominently the patches as
> staging/RFC/... (i.e. each of them). I know you have "RFC" in the
> cover letter one, but I am aware of at least one person that did not
> realize initially the patches were actually RFC. In addition, I would

Sure, I can try to make it more obvious by adding --subject-prefix="RFC: PATCH"
to git-format-patch.

> suggest that the cover letter explains where and how the patches where
> lifted from, so that people are aware of their state etc. I would also

I think that's actually explained in [2], which I referenced in the cover
letter. If you think there should be additional information, please let me know,
I'm happy to add it.

> recommend, for clarity and even if out of deference only, to mention
> whether the authors of the patches you are carrying were aware of this
> submission (i.e. if you explicitly heard from them).

Noted. But just to clarify (and I'm clearly not saying you implied something
else), not doing so is not meant to be understood as doing it without proper
deference. I was very careful in setting up proper authorship and co-authorship
(e.g. for fixes that I squashed into some commits).

> 
> Finally, it is not always possible "to get some immediate discussions
> going" (i.e. emphasis on "immediate"). It all depends on who / which
> subsystem / etc. you are dealing with.
> 
> Cheers,
> Miguel
> 

[1] https://rust-for-linux.zulipchat.com/#narrow/stream/415254-DRM/topic/Topic.20branches.20for.20staging.20Rust.20abstractions/near/426750399
[2] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u

