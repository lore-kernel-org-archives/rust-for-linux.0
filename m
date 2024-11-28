Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEBF142623
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 19:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732823759; cv=none; b=KB/s2x/cetIZEU0qb/UOQftnlLKEyF1Vz5kIDSvPSuJCUYVyTivekWRa7ZtJUufn93CUDO64PHsb7cKGGBV8ysl325GbMxFid5Kn+cpQou5MYrx2xk/4S77kvIxqXnjutC9vffrk+w0hre+1kqKbU+qO16kv6A5Qqol3IdvcAZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732823759; c=relaxed/simple;
	bh=B9P2ENiavm6q3s6Tk0/34QRTigY5JKurnCEpeKNL1x0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvP6Sq9JyfCHXxYkusfcUGnxSHRpYXHjBhIYDUlkTfHkl1UaAQ3d5jqWi0pcByIBgk1wHHn+4pmeBr4Vp3Y/ar5leZUhzwRCQ+K+ZuRzBC2whJxwX+wrkIFHwjm1QEpcgwXNOBoGIPYjgMjifn2TqzXxxwLSqLPkwmnm/O9LEfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W/+Qo14Q; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W/+Qo14Q"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffa12ad18cso13612631fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 11:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732823754; x=1733428554; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PYmYBYyArByRymcLIWmoSw8pIwozTi0i6w5/CUprJP4=;
        b=W/+Qo14QTWqk3gWGeTaCyn6TIyJHubqSG1lvxBt/4bCSeJwutP94HmiB4U9PVXIOk9
         D+A10nLuUo+yqdFAzNs6687ipcM86HzTOuVYfSr4rSH29wOcwr4K/190mKp/O5LPNAHF
         qrQYSWA+GfmT6I7iqdziowVuo3xOumtyXtZGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732823754; x=1733428554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYmYBYyArByRymcLIWmoSw8pIwozTi0i6w5/CUprJP4=;
        b=XtlSZECGRUArMcbUi5oM7rlYwl82hRBG+dA6fcMuK49eCSM+9KbqOQ5nslXVnWCSNt
         meVg/83Jkucs99gYTEIaYagGU4dn642yW6I65zOcEukgn8BjZhvsvTDZb7W4MLBHTAg0
         +3uZKHtLCee20fsBuK4Ottq+UQC/x/diiTY1eUv6QxD9mUIzgopeUuA+w82zxkMPyU1E
         nvDdcyzsJiZsM1W3ehJntKgaGHW8HlupmCDrlunCGw1/k6YByol1KUA2RhQrPPlhvG9h
         Sdhhrsde4WoU/EtU4v2FZDtIn1NKBd4BXxpOj73H8mhB+3s63j8IMRuB2d8dt+53GS02
         GE0g==
X-Forwarded-Encrypted: i=1; AJvYcCV1yMYbH1nwz0h6gKJfWrEqkig+3Le8j5HHa55ahJ5ZkSOdgHnBlKJxLu3O6dRCCFnWkFcnO5fPd4K43nSlcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjGXEtmtZIhNlvgn34/7IJpevccsJFJEnafYPmZL5aGcb7z5i
	YViVjW+9pf355KzyWFzGsQJUvPhyTRvdTF6dYQWAkvzv+FHhcN2HOzNWjhKPNETdaaUnELmgtku
	9X2d4qg==
X-Gm-Gg: ASbGnctekXVRqjhSTyMNBet60ojdaI7TFndfSewN2zC9gLhq76auY5e4VtDNA76KAHq
	LXkgz0otDM/p7xfPyDOmrh2ogBPJHLw1xCu+/C93tSbIGT3xs6m/hg+eKyFPS6WBdJRYQoNAxeV
	JRKVMvTRq89HTKYId+l+pu0f49LBn9qboZecb/I2QlI6ZaPB6A/9LCsz+X1PiFJ46dhDI9awRKL
	bF0uz6qSy4DM3EJhZLapBgXuHHderie9CAmmcFfTdupc3ow141qZfkVCYHgJ9smkr1TFoDw++wI
	vivUBCk5+2nDHbiteB/yI+HI
X-Google-Smtp-Source: AGHT+IHXFZB5f0/t8ePjURqOtODzZbTSvqI4SGzTmteRv5ZNhJkOsgQoxTQBgjj0nsyS5gS1dk3uKA==
X-Received: by 2002:a2e:9fc6:0:b0:2ff:c6cb:60bd with SMTP id 38308e7fff4ca-2ffd60e1964mr50133971fa.32.1732823754235;
        Thu, 28 Nov 2024 11:55:54 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfca0f03sm2731451fa.98.2024.11.28.11.55.51
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 11:55:52 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so1409657e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 11:55:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXO+GtppjR8T6ChR0IEaMFBRPlsGJQTkxNRIo6GdrYzZmkoEWZyS/pWgBNIZMlc2oaD0FJ5Gxg5FUC6IKkLmg==@vger.kernel.org
X-Received: by 2002:a05:6512:3b25:b0:53d:d3f1:2f4a with SMTP id
 2adb3069b0e04-53df00c74d2mr5053239e87.1.1732823751174; Thu, 28 Nov 2024
 11:55:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127131941.3444fbd9@gandalf.local.home>
In-Reply-To: <20241127131941.3444fbd9@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 Nov 2024 11:55:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgwQ5gDdHgN54n8hsm566x5bauNPsdZPXm6uOCFvPA1+Q@mail.gmail.com>
Message-ID: <CAHk-=wgwQ5gDdHgN54n8hsm566x5bauNPsdZPXm6uOCFvPA1+Q@mail.gmail.com>
Subject: Re: [GIT PULL] tracing: More updates for 6.13
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 10:18, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> [
>   NOTE: The rust tracepoint code added hooks to the same macros that were
>   modified in this pull request. The merge has non-trivial conflicts. I
>   fixed it up in my "for-next" branch in the same repository. That branch
>   was a merge of this branch into the commit where you pulled the rust
>   tracepoint code.

I checked my resolution against yours, and I don't think your
resolution is right.

You didn't check 'cond' on regular rust tracepoints, and you didn't do
any locking on either kind.

I've pushed out my resolution, and hopefully rust people can actually
test it. I might just be full of it.

That said, I also think that the "__rust_do_trace_##name" inline
helper should just be renamed to "__trace_##name", and then the
regular trace_##name() helper could use that inside the
static_branch_unlikely() check. Because that seems to be the only real
thing the "rust" version wants - avoiding the static branch
infrastructure in favor of whatever rust infrastructure.

But hey, I do basic sanity build testing of the rust code, I don't
actually _know_ it. Again, I might be missing something.

            Linus
