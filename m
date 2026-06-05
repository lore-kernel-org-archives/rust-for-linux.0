Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D814DA541
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661055; cv=none; b=KDsGVOsi1dnArnaFaCk7bNDyjxSeCNdO6ZLA2mof30awVkjG0J/zIiYcvUUqFJD5IkJXScncQhPH0NeQ7QOxDDnV4quplwer7YQztiNO89jkdjzOPy5ubkE1D3pmwGdYiHR124LkD5pdGlyiKIKzzEEVBx4TKQgZuLQKaBsFm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661055; c=relaxed/simple;
	bh=N6XKmlAMREdr2uCZkwlJrGsBwXvc57v1w60+6gASLs4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y9KZya049/qH+CEtqc629vHyeVbomI6VGaeXY8CawZOPzYmcvV/MSp6dyqg2Y8vxcU36D0mbYh6CKCh/KJgf/fVCWsS5TQZ/H9MVLDfZPO1f4gjUEpLg9PooUfnHyoHPGYq6d5nFcDOxV7giuGhzgy+gl5/LHcqK5xLGDm2Pyx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DphIqtgC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DphIqtgC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF401F00898;
	Fri,  5 Jun 2026 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780661050;
	bh=N6XKmlAMREdr2uCZkwlJrGsBwXvc57v1w60+6gASLs4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DphIqtgCt+wwr9uwG+J6KI77hWnFvaTMIa6KVIU9UppmQsco1dTHl0a9jmliN+Pw4
	 mC1BCfh+JlEvhC8THmJp/sQDQDdOE4PtgB+1Z2FnE4rd2MpQ+lVYpukjx2dai/Ry6o
	 aF+GST4uAUpXZ6TfCAeN91A/KzIJUQPgT64J9QMPcsROlKPe7EYJpMz9E718/MGffc
	 Fs58flMUDmpdH3IjuDrsfDFHeEYbFtR++OiY440+utfpvi7gReaqQVPxC9IKZStrMV
	 dQxwVn/OpE1NY+8HoBLrCYNqPX0h7Gxt0otaD/1ChEqxkuT1ATtj/flwi74M1b8FrU
	 SkSCSarkGRb/w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Yuan Tan <ytan089@ucr.edu>, ojeda@kernel.org, boqun@kernel.org,
 rust-for-linux@vger.kernel.org
Cc: zhiyunq@cs.ucr.edu, ardalan@uci.edu, pgovind2@uci.edu, dzueck@uci.edu,
 Yuan Tan <ytan089@ucr.edu>
Subject: Re: [PATCH 0/1] rust: block: mq: make GenDisk Send impl sound
In-Reply-To: <cover.1780633578.git.ytan089@ucr.edu>
References: <cover.1780633578.git.ytan089@ucr.edu>
Date: Fri, 05 Jun 2026 14:04:01 +0200
Message-ID: <87pl25i47i.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Yuan Tan <ytan089@ucr.edu> writes:

> Hi Linux kernel maintainers,
>
> We are developing a tool called FerroLens to detect potential unsound
> behavior in Rust code in the Linux kernel. FerroLens reported the following
> bug in rust/kernel/gendisk.rs.
>
> Gendisk is marked as Send although the fields it contains may not be.
> Specifically, the QueueData held in the raw gendisk pointer may not be safe
> to send across threads. Therefore, sending the Gendisk from one thread to
> another and dropping on a different thread may cause unsound behavior.
>
> Additionally, Gendisk contains an Arc<TagSet<T>>. This Arc would be Send
> and Sync if the underlying TagSet<T> were Send and Sync. But this is not
> explicitly derived, although it can be, since the API does not modify the
> TagSet.

Thanks for the patch. The `GenDisk` `Send` fix looks correct to me.

The implementation of `Send` and `Sync` for `TagSet` is not a fix, and
it was already sent to list [1]. It does however suffer the same issue
that you described for `GenDisk`, so I will address this when I send v2.

FYI, I did not receive your email in my inbox, I saw it on list. It
might be rejected by Proton for some reason.

Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/rust-for-linux/20260216-rnull-v6-19-rc5-send-v1-42-de9a7af4b469@kernel.org/


