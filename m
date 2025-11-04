Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDAC2C3254
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762248192; cv=none; b=g0lBb1V3ZXd5IVCeRLQSJWsCl1IhNm+94jbCxGPChQTfyFuKw2eI61efUaD0t88/fj33ViRXny1fGoSz9KWZLwrMPFgxzR1VB8B7FlhSrrZY+y8Y7aoiSJQ31O8DK2bQxqdO8S/vmVf2r1ZepFouuIp0O+/Uh3VQssCkw2rHpuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762248192; c=relaxed/simple;
	bh=Kl3ymaOvdEorHq/tMtguwV4BY2XHxKvD+d5JmI4NcA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibeVFNx1JwMxJle0K2i3UfBTYJRlD0s78wkj8YxPJqFti0m68rXd/Zwz8RRQiciVGNg3ISr+C1wDm6c3OhXKM1Ueezb+GXlNkdlG1w72jthJGvQcnVTXOHZhABQEVSEQKUspc63llLTMUTy1zUK47be4Bphf159cxqUHyMZL7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tY4Qw5zC; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tY4Qw5zC"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-65682d20e4cso3618619eaf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 01:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762248187; x=1762852987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uEcY1THHyfzqAcDD0/EuOc65ogk6e82VPZCm7JWUeo=;
        b=tY4Qw5zCGke4wX7tr3I0xG2ky1UINjUxh/XFUfqos3pdtBoT1okR7VUUeGhwH/pXe2
         eq3+BJDZqiuZrkjmd/gSHf8yv9BqjSUNg2RY/OYL5eECInufDU4/6/PVKcd/JWysv874
         9IIDbCcZX9978qJIAoG77R1zXqkLRd2ZjN+j7YqV7cV7Zw6YrUicAG3JqJ4eXjZwBaST
         4iz8F7lHSOcEYU9hn3O/m9MVtqtKeePXW40SLVXxs3y04ZN8WZzKQUoTFHZOx14bhZ+q
         RtQJ/HdAl3AgB1lnZcylVNu6BbFYrk2VFHmHJktQDZ15TUDnta4V16C2s1Cya+86ZSwt
         B9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762248187; x=1762852987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uEcY1THHyfzqAcDD0/EuOc65ogk6e82VPZCm7JWUeo=;
        b=WetNiAqkrMYz3ddNzi4yn+OjhSu2JhO7nkA8DlTzazDcRgXPxb/YeRAzpcb9kUXO8Y
         c3O38QL5jzSVCEaYy/jE830TinVWvjVE2m9cBLGySU0Yh7hpSH/fTr2xaEWGwvQiqxF2
         99ryhX8ybyayHHnjgj75RIRRgCEXh37pvyqfEC6Nfg26ughfIxtn4hHjXpwFYtqBqZPJ
         AG5KWjt6aWcVja9sOE+icgw01kYZ4JXRh5K8x2zofNLZgitE9PMY8XRn+/rsZveO9Wqk
         wZmLgxJohq2M2Mr5Q7uhc09GDc+h2c+EgCFcwnElQDzfZ5VpPDNuxP7BOzMjFPTVuwLb
         j9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUwJpe7CofaUNFjKKcjZ07SHWpEfGgY4bx/flcIjygJ3LAfhNNpaoEoJwBJajwd5txMWwufARExdV+IZURgEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxyZ7yLrjxHutBTcgHl/KGKFOPp2uXezhKsT1SzwP3SvHU5KXJ
	rIxmPbfaV411FPfnMf2TRkYashERduvVZHxacT/utdxrdDhqWwBkA5ANf6VepOlJYPJHZAX/bS6
	upiXsIvbblF9vziS48QkkwJNc1tlIK8QpQRpo2lTd
X-Gm-Gg: ASbGnctn2K7IZ07OayIozi4WBcJEP9nX2eWIomCoaahcJSJbvioM7/3g8Bri77hZR1M
	YpsFyCgs+3Wh0qUvX9/F1oyEWdYpwfaCk0+9PrXX7Z4KWwprDWQCNZH/L8AEcdUW3ixIo/N6mgz
	UAy1rkE77wpg2CNNGNDpT7anv5DvFiFUvwTeWf9ffSUuA1cuiSTqTcf0qB5/w/l6u+F65Olk/dv
	uJMQf5HFbxF9nbY657yngtGiltqL8HZTJNqJDpkFUFyssB30VKj0h2TPWIA1vxvG1o89bCiVIdi
	j2qMPJmREws1WX+0K/9lwzcBgktvkYmgXrDgjMtce48xUEyN1BPkBWqEx0/XgU+JnjJN
X-Google-Smtp-Source: AGHT+IEAsy+Ag+yaItapCExK24GtCcf/j8K63MuNbVIu7hQfCrBcuGDModsryJjrA8zmOkQf1hkkbI/HJmgX9pS7YQM=
X-Received: by 2002:a05:6820:4cc9:b0:654:f93d:fded with SMTP id
 006d021491bc7-656afa9f1eamr1006743eaf.2.1762248187177; Tue, 04 Nov 2025
 01:23:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6909c4a9.050a0220.98a6.00a9.GAE@google.com>
In-Reply-To: <6909c4a9.050a0220.98a6.00a9.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 4 Nov 2025 10:22:55 +0100
X-Gm-Features: AWmQ_bmGQf2nILT2ScyTlAWpbuk9uek2__b997E7Chd9LCNJiYdk3ZcAgWaVrbM
Message-ID: <CANp29Y4L45Z1OK6mS2rGwHmA-0CP2a0qD7G3NCz=CcbqEFNUyQ@mail.gmail.com>
Subject: Re: [syzbot] linux-next build error (24)
To: syzbot <syzbot+c78a89917a1b7c0fa4c6@syzkaller.appspotmail.com>, 
	rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ rust-for-linux

On Tue, Nov 4, 2025 at 10:17=E2=80=AFAM syzbot
<syzbot+c78a89917a1b7c0fa4c6@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    982312090977 Add linux-next specific files for 20251103
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D110f817c58000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D1cf6c387ad3e8=
e7a
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc78a89917a1b7c0=
fa4c6
> compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b797=
6-1~exp1~20250708183702.136), Debian LLD 20.1.8
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+c78a89917a1b7c0fa4c6@syzkaller.appspotmail.com
>
> error[E0599]: no method named `data` found for struct `core::pin::Pin<kbo=
x::Box<T, Kmalloc>>` in the current scope
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
