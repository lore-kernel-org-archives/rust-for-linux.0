Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047F33E00A3
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780653313; cv=none; b=fiqIOS/CmV4UP493+A8lXcWpvjpdig6/JcS8kKEqtOAqBfcfhi0RfxfkiAcV70nF3fgS6wxrvWzhSB/kVj2WBNB5e+h/KQ/ecU+vRZilP/nYg7OTq9zKIIJd4H4pBGFgHi5rT/Aat5ds8x6HsKrtdMr6eoHO4JdWzy708lo+sh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780653313; c=relaxed/simple;
	bh=jzsYnyJqqxs071+dkXVFT22bl9DpZ340fcngI2Oq0jM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L55bwvDkDZ85X8n+ZTA4Xx5j00KA72XvoPZMYTB4XLRsa3C78AEhHiYypoTHc+uQb9AoPsBioZyO5pfxe+WJ6XAGIcpRZS1f7d7fnrtxXgsz4NyL65tg9aYFehOibvhFv9fUvyHUwNKTIa8qKPucRIxspk9p/Rh1cDj+B7XpkF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m+BflUGO; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m+BflUGO"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490ae0167ceso8192725e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780653309; x=1781258109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yMfDoO2RYXr1GI4L9U4nci2FpW0H81+kiZg7aLI1vc=;
        b=m+BflUGOpg2f+7ldQv3ibBSjAYHlEJXHW+ccx/JrxqXXNDslEwBFJ410Xabh6oROsj
         dvxK5h4CXhqJ1q5+ImSU7ulI4EIBdg89DBuNmPY++eUCKk5A+FAUZGVw58QrSOLjXnw8
         WfQ9rYPIhnSAoBQAGJFpTOg9wNlWb9VuQjuWifcywggtOfZ4Lbs8lUognHWLuGPrzr0a
         F1Y9KemmOPYJSW6FBT9pMA7EughxKACQ/DFvNGTjBmEEtZbwkYuRCKOjQAxe3XwawL3s
         XPrDpnqIg2KbqGKQMnlcA22KNHROk7B/Shkp7rCeOjg6U0WsgYYx84K/ky8B1iCLxrhI
         mYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780653309; x=1781258109;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2yMfDoO2RYXr1GI4L9U4nci2FpW0H81+kiZg7aLI1vc=;
        b=XqTOuE+bKwlQgBXUpGjfKQEpPdC1bsvRPH9rvKZhupP3jZTJfn2XCYCuvFIKjduisP
         A9cIf/YnG8pbAG776Mu16Fo+/kAweQ6N5a7Vn+1N1CiYicT42jH53i4+6VyJX7c6OiQz
         yCwymseJL2jBaJXTzcgzVopBYDD7GgUt7Zw0qAISZLn8Q0mIJ4CnAfkmocwc4zxhHbGd
         +cHfijHYtArtURGcknSgkAvPbORJsujmvQ4TwH/W80CB+Gq3DGsM/EYU3SXogHwTCzYD
         8vuXWLRRUKA878f3ZdQjBeuv3lP6gXnyyr9pWo19AmhvjuWbbQfJt7XB185k21DnXHjx
         RERw==
X-Forwarded-Encrypted: i=1; AFNElJ81etnpXXGKLo4o2+Xz57ckEXpMjO2krVoHIuL0/arYIQQYN0EOBqVhttvvxr/dFra21uLdDOeDpvC6pxICUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSUVgg+A4y48366T7AkbsmyQ6CLKcxDGy8mb+q+LIDfnZDfowF
	BueHU19nBZ4IvbxS9Ge33inabHdXsa4Pw7pLW+mNV1Xk2cCjW//fFfTVb5NxEwc8kJ+Swl4N1Gc
	7lGDsJf8KD4Tm1vk6Ig==
X-Received: from wmnn26-n2.prod.google.com ([2002:a05:600d:15a:20b0:490:af44:67a5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d12:b0:490:7227:100 with SMTP id 5b1f17b1804b1-490c26049a0mr42084355e9.18.1780653309246;
 Fri, 05 Jun 2026 02:55:09 -0700 (PDT)
Date: Fri, 5 Jun 2026 09:55:07 +0000
In-Reply-To: <0dd33a00-8fe9-49e1-a32f-565c4a312429@est.tech>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260603-b4-binder-hardening-v1-0-d0aae3556c9b@est.tech>
 <CAH5fLgh664qa63CBqWY1CVNkdMwJbOPNzzPawpm8Ctz4U219gw@mail.gmail.com> <0dd33a00-8fe9-49e1-a32f-565c4a312429@est.tech>
Message-ID: <aiKc-4v4T4X4DKSL@google.com>
Subject: Re: [PATCH 0/4] binder: cap max_threads and reject duplicate looper entry
From: Alice Ryhl <aliceryhl@google.com>
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Brian Swetland <swetland@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 10:27:19PM +0200, Yunseong Kim wrote:
> Hi Alice,
>=20
> On 6/3/26 20:57, Alice Ryhl wrote:
> > On Wed, Jun 3, 2026 at 8:02=E2=80=AFPM Yunseong Kim <yunseong.kim@est.t=
ech> wrote:
> >=20
> > My understanding is that the only thing BINDER_SET_MAX_THREADS does is
> > cause the kernel to tell userspace "please spawn more threads" when
> > all threads are in use and there are incoming transactions. I don't
> > understand how it helps by pass ulimit. Did you try running your test
> > with the Binder ioctl removed? I'd guess that if it passes now, it
> > still passes with the Binder ioctl deleted.
> You're right. I ran the test you suggested and confirmed there is no
> bypass =E2=80=94 RLIMIT_NPROC is enforced by copy_process() at clone() ti=
me,
> regardless of binder's max_threads value:
>=20
> // Test: uid=3D65534, RLIMIT_NPROC=3D50, with and without SET_MAX_THREADS
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <pthread.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <string.h>
> #include <sys/ioctl.h>
> #include <sys/mman.h>
> #include <sys/mount.h>
> #include <sys/stat.h>
> #include <sys/resource.h>
> #include <stdint.h>
> #include <linux/android/binder.h>
>=20
> static void *thread_fn(void *arg) { pause(); return NULL; }
>=20
> int main(int argc, char **argv)
> {
>     int use_binder =3D (argc > 1 && strcmp(argv[1], "binder") =3D=3D 0);
>=20
>     mkdir("/dev/binderfs", 0755);
>     mount("binder", "/dev/binderfs", "binder", 0, NULL);
>     chmod("/dev/binderfs/binder", 0666);
>=20
>     struct rlimit rl =3D { .rlim_cur =3D 50, .rlim_max =3D 50 };
>     setrlimit(RLIMIT_NPROC, &rl);
>     setgid(65534);
>     setuid(65534);
>=20
>     if (use_binder) {
>         int fd =3D open("/dev/binderfs/binder", O_RDWR);
>         if (fd >=3D 0) {
>             mmap(NULL, 128*1024, PROT_READ, MAP_PRIVATE, fd, 0);
>             uint32_t max =3D 0xFFFFFFFF;
>             ioctl(fd, BINDER_SET_MAX_THREADS, &max);
>         }
>     }
>=20
>     int created =3D 0;
>     pthread_attr_t attr;
>     pthread_attr_init(&attr);
>     pthread_attr_setstacksize(&attr, 16384);
>     for (int i =3D 0; i < 300; i++) {
>         pthread_t t;
>         if (pthread_create(&t, &attr, thread_fn, NULL)) break;
>         pthread_detach(t);
>         created++;
>     }
>     printf("[%s] uid=3D%d RLIMIT_NPROC=3D50 -> threads: %d\n",
>            use_binder ? "WITH binder" : "NO binder", getuid(), created);
>     return 0;
> }
>=20
> Result:
>=20
>     [NO binder]   uid=3D65534 RLIMIT_NPROC=3D50 -> threads: 49
>     [WITH binder] uid=3D65534 RLIMIT_NPROC=3D50 -> threads: 49
>=20
> Identical. SET_MAX_THREADS has no effect on the thread creation limit.
> My original PoC was flawed =E2=80=94 it ran as root where RLIMIT_NPROC is=
 not
> enforced, making the binder ioctl irrelevant.
>=20
> I think accepting 0xFFFFFFFF for a thread pool size is arguably poor inpu=
t
> validation. no sane userspace would request 4 billion threads.
>
> Would a separate patch (without Fixes tag) that caps max_threads at a
> reasonable upper bound be welcome, or is it not worth the churn? this is
> hardening, not a security fix.

I don't think that's useful.

Alice
