Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC7B2C9D
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Aug 2024 00:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725062780; cv=none; b=beKPwqUzGttJZ0G94WXu8zhDuYJTCpW18yJoNSSUj/vFiEP2boYrZnwHqorQs+1qVOkCiIayysfQ1TPiQ+Rm91/IPwKTD2Los8UaL/dQRpYVw6LPHul2jO08MWQ1JqJcpYpkOh000mDnzM2hPF5jVsGHrWdgK81G3mtQqaIVBMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725062780; c=relaxed/simple;
	bh=n8xcqiHEzhMcHy2TGqeuIA4zEqW0LBBlmS3A1RDmuII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkDtcqdjFPh16TYhLw7e3eVK9+PTLJxjzh3i4D6gWxW1AbbIn3zDh3R5APWfHfy3YU6kZ/tnXRlM88k33tYs2CJuszW1XG0xUuwozs+bC6JCf7PQzJOZuQSpVaDRgBcB8BiSrwhGtupD1gIUXA4Siwrv0sv0dIDTZMQvGDBScH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3vHhwB/r; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3vHhwB/r"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4567fe32141so79721cf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Aug 2024 17:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725062777; x=1725667577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8xcqiHEzhMcHy2TGqeuIA4zEqW0LBBlmS3A1RDmuII=;
        b=3vHhwB/rvceYxkjD9IZz+rYaiCLZQGsFAT0Y6tqw29EeC9vQfiHmHQFKQdH7t0XgyA
         ka93vNsLHaXQYaxHdvxrkoZc9hQz6EJvlHImjserC7JTNY/HSwBkQ66f2WrEH6UYf+dd
         EVNjrTeszz/K9UMyzgHJmzc76dqF3ZI4pxTNadrjBBuZqea0ZuyFlYGWdv+fBr/e0HcS
         Xv4QWl8xUlmRh462iNuLhzepBAgxql7at6Y7M/Vn5K+aVlxmJ3abTsz+q8uStO/IuCpM
         6icFmQQZLLOe84MWI7h4OdH7ppmKfNqb7F0qzIPiz4Z+o0CKR8wdsOZ8T2uBhiK5bXsw
         SxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725062777; x=1725667577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8xcqiHEzhMcHy2TGqeuIA4zEqW0LBBlmS3A1RDmuII=;
        b=rLrphLJo5K/dYGoKz+e/ZkAX/SVSKA0T6kKAP0K9zuXDKWSutR8UdcKUC1UpZXLyJG
         MzVn4m1RWphSnkjnZ1AotlfhfcetGK1J05KhHyjPfXqxmKI+GYa1bDrZoYgr2IpZnUh8
         HfAjEFEg5MrnCVKhdup2alfQ3pZvqjcGMCmjyUCYfyxFhQxRTnVxa1Fw07ih59PUYck4
         PMIgydDOw9SHJ0a1JOY4DRKfNtO2fKklvKKHnBf/UOv9eNntwD3v6AxaulRXCx++Zpim
         MtDMKxZZTH8EQW8KGAD3rU8QhI5ZCGSty2btiRGlYKDcG+K/QgvX97ChRilixmqoouxF
         8sLA==
X-Forwarded-Encrypted: i=1; AJvYcCVzGd0yYLqByur9Ijnk/xWOcYEW0GQDj5N4FnZdpZTF2cMq6sismgzlgdBK/RxOAu+6zChaj8GzQcD8NrpwYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD8dG429E9NTrhgvrIwXwTiUJDgLOVO3ljog5K7FaMDkJyNaib
	sSSlaGRSSfOwrzSjtVCIytR16mFAWLTi6g+ZKK1H0cmhjhGY+3pAXJcGuhmeNTi5zU41zu29nVh
	E0C4nhdzvlFSnKwPCJyg9n9GneiI5K3uY3ySJ
X-Google-Smtp-Source: AGHT+IFg6NnIqNYSyCQdp+4piRmBL+jQdTn0fkJWHCEEU/fYsuOdUxONjCSJBEQ2wyGjIkWsARNyrhv7f4RZhj+2hRc=
X-Received: by 2002:ac8:5987:0:b0:447:e847:486 with SMTP id
 d75a77b69052e-457c41b4ae7mr670401cf.3.1725062777214; Fri, 30 Aug 2024
 17:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
In-Reply-To: <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Sat, 31 Aug 2024 00:05:40 +0000
Message-ID: <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Miroslav Benes <mbenes@suse.cz>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miroslav,

On Fri, Aug 30, 2024 at 9:34=E2=80=AFAM Miroslav Benes <mbenes@suse.cz> wro=
te:
>
> yes, this is one of the approaches we use in SLES. We add kabi paddings
> to some structures in advance (see [1] as a random example) and then use
> it later if needed.
>
> It is not the only approach. Much more often we do not have a padding and
> use alignment holes ([5]), addition of a new member to the end of a
> structure ([2] or [3]) and such "tricks" ([4] for a newly fully defined
> structure).

Thanks for bringing this up! Sounds like we're also going to need a
way to completely exclude specific fields from the output then. I
think we can use a similar union approach, but instead of instructing
the tool to use another type, we can just indicate that the field
should be skipped. I'll come up with a solution for v3.

Sami
