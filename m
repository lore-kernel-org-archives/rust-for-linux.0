Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0B66FAF
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707239989; cv=none; b=jrn/65Aw8EpsRrO9nv7x/KLcTZJQepoAcvUPx+jgf4xRGH6e4QzmJvix/+J0At8Jx2TxFY+aFEsjQySLvDqFEkltWCFDtAbhwabnuAApFnn7pdmEwqu8X3QAD4jx3WX9LZPvXtFuUE5akS4klqyaldO/bwZjnutggST46ywBITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707239989; c=relaxed/simple;
	bh=qW5yF05QtwSTbmJyhiZJbObItIFaAM3GEm2ej9UwgkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROQHwd+78RPFzoFNNy5o98EhDoEjRzVzwPOSIIrugx1ei0cfn8uuhgjtB4nma51XD+dsGDfDWuBFyaHYIoY0pntiA+wJ35ZjxGfzBpgbFSgjI8uluKC+nZgNEA0IuwDMh7JXrzPcNn7bX3XH7JANW2vCTMHYeSprikPuodJwn1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdKsuYf6; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdKsuYf6"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-603fd31f5c2so6595507b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 09:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707239987; x=1707844787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW5yF05QtwSTbmJyhiZJbObItIFaAM3GEm2ej9UwgkQ=;
        b=BdKsuYf6u/bYNGlMdK0OSKLDd+1xPUCHn2tstOmMEA0gnflcDTwnwD8DnSesBGlq0p
         NvBeraWSBJO5Uz+SQx/SXXhxLwcJWZAWdZ2S5zs05sn0/qbHTdnBf1LZ/XW6uqcjj1W1
         cGcLyGAXhYOaHGUu+eu5ZUiuNs+/lMDouwesfGER0CD+k1oj2j2Rkb4wi9yqZubqlP5N
         OReLPKWEuAmsjV8I8Tu3LQg/mxmzNS5tiMMkS67Ng4wqWjUCJz6kQj+cFq1+HCuJn4eB
         d6un6QBlXUTr2zH9bjNF9upx+9CFIMUHj1ILodF2QArS/vzSXz8N+TNCcycxSZvUkv2K
         BwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707239987; x=1707844787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qW5yF05QtwSTbmJyhiZJbObItIFaAM3GEm2ej9UwgkQ=;
        b=pMw4dzCEVDgAV1QtBzZJw0m/k/kc3lZ7yNZzQtDd9q94d0VTZFqy0+i0IWA0im+qm9
         6IIcrF6Tv6Ox+yK/H/+4+H5LlGkR0R+tgVfuG1OdVII23zcCd5F8gY98C9CjK3Jyk785
         oku1IsU6IQa8LL2lazZjC7Q2MvqanspcmreI8ZqY+BnOgNnXcGBwtIc+PLI4t0AI9WEH
         xiDdwAua3e4PO3lRzkQZN4pAOHB+xBpMqnHvc2nRw06jHUBLvQQxQ8b9Z1VzWriDeNxc
         xaZSOJsKfAnjGPsZF80/QU56kJ2PNGACy5FaUc4qEwgBBfJqfh76aZWAnzFggJYVTVcq
         b8Sg==
X-Gm-Message-State: AOJu0YwO/ZEisegL3SNo17QfSwKITHlgrVMv7LhrFH8Nn2GIp1q1jNTc
	MrXlpLBPY/leSqaNxDiAh0nZxpGsGg6QcMkxWXRUHxe3wN7D5+g98UccTpe4Ehf3zQGg2Ye5WmP
	rmPl80p49fU1eoVodW7MD8wNOaBY=
X-Google-Smtp-Source: AGHT+IHKrdMneOXn5In3e68OVdMS82N4C8roQBCH0tqDjsuNFMAwrg05aogczAUkS10HXjj0JNEoNEPkh0K73PHr+e4=
X-Received: by 2002:a25:aba5:0:b0:dbe:d2ec:e31 with SMTP id
 v34-20020a25aba5000000b00dbed2ec0e31mr1764277ybi.27.1707239987281; Tue, 06
 Feb 2024 09:19:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <2024020646-browbeat-cozily-0bf2@gregkh> <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>
 <20240206144959.GE296718@fedora-laptop>
In-Reply-To: <20240206144959.GE296718@fedora-laptop>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Feb 2024 18:19:35 +0100
Message-ID: <CANiq72nHOQtydmNPNDiHmJR+74TR2uRthGRY19f-d7_Mf8JOAA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in .init.text
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: Greg KH <greg@kroah.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 3:50=E2=80=AFPM Thomas Bertschinger
<tahbertschinger@gmail.com> wrote:
>
> I can send a v3 that fixes the wording of the comment; it's worth being
> correct.

(Perhaps you didn't mean this, but just to be clear...)

No, safety sections are not incorrect just because they are not as
relaxed as they could be. They aren't "normal" comments -- they don't
document what the function does or could do.

In many cases, relaxing the preconditions is what you want, of course,
because that makes the function easier to call (and ideally make them
safe); but in some cases you may not want that, e.g. because you don't
want callers to start to rely on something you may change later even
if you happen to support it now.

Because of this, the absence of a safety section can actually be what
makes it incorrect, unlike "normal" comments where removing them is a
easy way to avoid mistakes in the comment :)

Now, we may nevertheless want to relax the preconditions here or
document (somewhere that is not the safety section) what the function
could offer, but my point is that it is perfectly OK to have a
function with restricted preconditions.

And this is one of those cases where it can make sense: unless we
expect to have a use case in-tree for this, I don't see the need to
let others call this.

Cheers,
Miguel
