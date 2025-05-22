Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B72641CA
	for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907261; cv=none; b=nlklYiPvW9wihvsl1XDjdlx7Cpft0xG8ZEUE+W0bnTOIezUXsLTc8XaWgo1n8jOJKIOwZFs7GZ4JEYQa9xG2bYj1ZyTb3drnUK4ipWTn0iOKkSHl5gqYMbx38DhbJmo8M70ixwEdit99htrZ1h2o2+LNtjRdVdU1oTrt1RgGcqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907261; c=relaxed/simple;
	bh=1gTNMgRKUHAld90vR1sH+nLjtjThPJyj7HAuJmFzFa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyxzHu3+G9PiVQJkO+LqQZ1zb+C8hIXdX8AzaL5dIZXrcDBxhdgkLYSs7n9ial/Q3WRftVzipUI0+zDgkFKFbhr2Qq8PSw9Cxk0LqmZwnNBI2Hhqh2zmK5zJMzr7LfyaJ1rQeEQJ0a9tCGoEdtKAu2wGyDG1CVWppxMn9BIZiLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cP0KeIET; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cP0KeIET"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af907e48e00so666615a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 02:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747907259; x=1748512059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5o03HSzb4qGl96/NuUaDuCPfSLARWbNjDTSsaEnK5c=;
        b=cP0KeIET4ooVqtI3xv5b2Jf5xJpRy5lC81G4w9Y8Vpd8hLC5HBLCDUj1dwS8YfIsCD
         LcrzE3VMUaAshq2YtkGdF1VLnSqypBnRIqjgAXKD9KsCLZQSsVo6qB/pgCG/wbRzWxq/
         Mb5BvZntJoOiKjNyC/ojLMIHyQ8/x3e+i9ahwm8H/dW3iTgxdSXuAjJpmky+umGQYjdl
         xTIOFC/+LrOnW6SwaRgSb9LLUbQsWcP2YmnTlrUefMLB3c/THDNlPH3Fal5yqXSZhtkd
         hTk+ZLyxgxtnirdBo2qf4CHnjwgZTndGbLG/ip60zj9DFLrydR1XEJSYwnlq0rw00tYk
         E/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747907259; x=1748512059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5o03HSzb4qGl96/NuUaDuCPfSLARWbNjDTSsaEnK5c=;
        b=Vhy5VJZKC+3UBcbXO1brvCpDq7jiKRMJmhHE7JLfRH0OoMuLVkbRwWXwZRqkzJQNBD
         ZUbqhjNgfyus2NcinRkBZtw6wmWrl9EXpl/DJ6aIXDmUXJmiX2A4OFy5I/piN0Npz+8O
         7k4hMeGUimY2leG1VyYIrogg9zqkVj5Bfzdv9cbTC5+M97+tgroV/p85IC49vHWWhXWg
         PzjIZlL+OMLEfXRuCOqCZz4rQLElPG2AuOvXNkpl9RG1MPyXXOopFL5JbHJaG9TFD8tq
         SLfnduw9tDkGPVAybALuJiRZuFS6CXCK1EnqZ/9ul0tetj8y8midx1h0P54Bn7yF4UQ1
         jvVg==
X-Forwarded-Encrypted: i=1; AJvYcCXxdtjunhytDQZ716dmmBbchuyOhqs6fpKMKr2PTS7uN0OKGFKVvym9gBNmnupih2Y9ahUSSOrjxj7JFj44bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFQosmcPasP+2+uRQ35bPrikTtHAkLJCktqIBKGdZamOAHqNkh
	m8uvqVptFuSoRiYeNCfa4ovcUKncDvf1jWxe9w1vFuMuvrXaS1SKTf+1SeoJY1gmIksN7rvexQ7
	NJ6iAmjxGAHLJaNY5Du8wDMWTrezOS1U=
X-Gm-Gg: ASbGnculyZoMWZgoowb7CzZeF162UkzHY1dpV9nzhynzj8rk6L1Oh4BpKY2ZqtMRdXZ
	kna35/szyIG0ZsHvGR9bZGJtaxY/g751qhGv7LOpfTlO4CEEf6B6v4glkiB6mn5oghjbco4yqzM
	F5nvcStKweP/fzgsrZs9lkA8DTpthtjR/P
X-Google-Smtp-Source: AGHT+IEWmhJfcFSVqb9pAPCIs5SnN1oPsQeS+0BiluRWk1B4+GtKVuJ+sUudOyHa6cWIer6mHWQwTzIxRKXcB+Xeriw=
X-Received: by 2002:a17:903:b4e:b0:224:8bf:6d83 with SMTP id
 d9443c01a7336-231d43d1938mr132114605ad.8.1747907259005; Thu, 22 May 2025
 02:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308044506.14458-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250308044506.14458-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 11:47:26 +0200
X-Gm-Features: AX0GCFsL3iGOODXoaUDJSsx6ruE8RP4Ean1X8cbI8elZV-Mrgv6UAThPUrVELyk
Message-ID: <CANiq72kGzjC3uR++wTsZA+wAJcEAUnAfzo1NfGP07T5o3UfRaw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: module: place cleanup_module() in .exit.text section
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 5:45=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Place cleanup_module() in .exit.text section. Currently,
> cleanup_module() is likely placed in the .text section. It's
> inconsistent with the layout of C modules, where cleanup_module() is
> placed in .exit.text.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Boqun asked for an example of how the section changed to be
      put in the log. Tomonori provided the following examples:

        C module:

          $ objdump -t ~/build/x86/drivers/block/loop.o|grep clean
          0000000000000000 l     O .exit.data    0000000000000008
__UNIQUE_ID___addressable_cleanup_module412
          0000000000000000 g     F .exit.text    000000000000009c cleanup_m=
odule

        Rust module without this patch:

          $ objdump -t ~/build/x86/samples/rust/rust_minimal.o|grep clean
          00000000000002b0 g     F .text         00000000000000c6 cleanup_m=
odule
          0000000000000000 g     O .exit.data    0000000000000008
_R...___UNIQUE_ID___addressable_cleanup_module

        Rust module with this patch:

          $ objdump -t ~/build/x86/samples/rust/rust_minimal.o|grep clean
          0000000000000000 g     F .exit.text    00000000000000c6 cleanup_m=
odule
          0000000000000000 g     O .exit.data    0000000000000008
_R...___UNIQUE_ID___addressable_cleanup_module

      - Miguel ]

Cheers,
Miguel
