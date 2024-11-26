Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267A48831
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 20:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732653145; cv=none; b=h9UXot+50bcVriHb0nBvtLESW3qJKZv9sLLHtLNvs0NfgSR+nYsGxYfcfwjrHKgWwRTeGG67qJYwxCAb+E1XY9Mk5tyoVBYRxnbviXVAAxLhFRpFMrU6JpBKL0eBXrTKCKWlodA2j9vtTADAXA6rGiArvpkL8eylfJeHHF5SYD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732653145; c=relaxed/simple;
	bh=nx4h0UfwGy/Xhxwaj52odLilzACf8JBjVoXxa3cImu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8BnMXDimGz9ad2ZssO38x9l5hixiXD4EbvQE4AtXAOvdpRcenVv7hhw5iWG3FFGmC0vXBoqYXuxZ/2DvHWblbEsL6L/Jw3kixuj3vhUsJA0OeXEsNHlk92/+C4DcFmbD4LkRKMFUOsKDC9M3WBLWbJcm0XZrHck5Ur9TEsijl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nCjgHONy; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nCjgHONy"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so2530a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 12:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732653142; x=1733257942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiouVvQy1ysSNzucyHX39VpOdsi6a4Dd/ylDP/YY+tM=;
        b=nCjgHONy217Oi3mxKCjW1vTvjZ+6XNMPaWmfCD1EnW/8VjXfrPrZMlEkwvoi8p2k0B
         L9t/Z56X4BzCaqfhyLAyaYmErMuROla9Sk5bw0MObK2toUuTw3DhPn3I65TVmjfZZzcS
         tYsO7z4PQr7IU2ypSa9QLMG5Tz8JtnKaqYd9EipM20YdvgNCpo1WxuoCGWSwrtyfIqML
         qZlMPeZgy9NvxaAMDFUYFg246PSo4hidecduyFYoTsg9b27rD5U6IqO9p93vQXbtAnib
         hszSNuPlsqmRYjYM/j17wY3xefz/bRfHAPv6m+PxdGJYr95cIsVwiGfenOz8qcqJEVTx
         R8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732653142; x=1733257942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiouVvQy1ysSNzucyHX39VpOdsi6a4Dd/ylDP/YY+tM=;
        b=Mkbgdw+NS8jk4j1NTLVXL7Ra0IUx58IBsdzDaRjTq3W3yR3YXskapOWFks+D8+x0s6
         A4AQUxaX5M5uAwlxeWAhUGwhufd0mF/rpQXJD4+uGg+jLHdO9eq4+3C012Bb+1eRg5xZ
         cNz5yjlCsjjXfIpu4/giMy2G5b34UfyY07Y9z9ygaQ+A5Pt7FLa2A9bsNycOsalmRP49
         CHikdzLfjHZfcc9Hi2ZHeQNOJNCxFnCzRYHOjubnezlDAjKPGIQpn4+xyBxSoodocVMt
         qDd3p3JuiE3WK3VyZQB3p3KwtR5QlHbikcDL9LM3StDhtoSgpVsZfsAac1o3MTJoOKLZ
         8WvA==
X-Forwarded-Encrypted: i=1; AJvYcCW0BH1VxOzcB+pIrJiZPcVT4HQWQAHS9Qr999Tbbg0D38QElSetJmFJSe1c2vOMXvOgFJZ/S59XlXImo/Sqzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0RhxU7TR+wtPdMyEXPjyW8oKLudJ9Tadd5Vl70gzp3gIg4mso
	sRjiePLTdFdrVsZI1jhn3VMqPXY9pBWlfqN5yNQRAlt8x8bwP2lRoBOnnhDX8/szJMbkTyUw63m
	40ZAM/+EQ5M5ohuyJ8XTshiO1mtFsLZ8CHLkm
X-Gm-Gg: ASbGncsrbmo3la+lGwzIphnZp3plGcUjg8wu+NPR7HDqYR64kdwckiVmbCERXGHBn2I
	JXgm1yO9QS11fP0JW0vz3KEw+uYJgrwbI5hlQ8ZpRH9cpwEZXshddbMjl5RY=
X-Google-Smtp-Source: AGHT+IFLGtY2k1/yQLTkkaMGF/8QTmikGJDbPMCtQvYW3IFdPIMrHqR0uhIysGxFKp0f4Ab0QhOn0doTUEbLkLZBzts=
X-Received: by 2002:aa7:d80b:0:b0:5d0:3ddd:c773 with SMTP id
 4fb4d7f45d1cf-5d0819b8bf8mr11824a12.4.1732653141887; Tue, 26 Nov 2024
 12:32:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119112408.779243-1-abdiel.janulgue@gmail.com>
 <Zz1sHZLruF5sv7JT@casper.infradead.org> <CAH5fLgiyHGQJxLxigvZDHPJ84s1fw_OXtdhGTd0pv_X3bCZUgA@mail.gmail.com>
 <Zz4MQO79vVFhgfJZ@tardis.local> <Zz4WFnyTWUDPsH4m@casper.infradead.org>
In-Reply-To: <Zz4WFnyTWUDPsH4m@casper.infradead.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 26 Nov 2024 21:31:46 +0100
Message-ID: <CAG48ez3YBvSQ0zHY-t8NK2RWthR-GsEv6O5pVwA44LGJaEGeSQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: page: Add support for existing struct page mappings
To: Matthew Wilcox <willy@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 6:02=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
> On Wed, Nov 20, 2024 at 08:20:16AM -0800, Boqun Feng wrote:
> > On Wed, Nov 20, 2024 at 10:10:44AM +0100, Alice Ryhl wrote:
> > > On Wed, Nov 20, 2024 at 5:57=E2=80=AFAM Matthew Wilcox <willy@infrade=
ad.org> wrote:
> > > > We don't have a fully formed destination yet, so I can't give you a
> > > > definite answer to a lot of questions.  Obviously I don't want to h=
old
> > > > up the Rust project in any way, but I need to know that what we're =
trying
> > > > to do will be expressible in Rust.
> > > >
> > > > Can we avoid referring to a page's refcount?
> > >
> > > I don't think this patch needs the refcount at all, and the previous
> > > version did not expose it. This came out of the advice to use put_pag=
e
> > > over free_page. Does this mean that we should switch to put_page but
> > > not use get_page?
>
> Did I advise using put_page() over free_page()?  I hope I didn't say
> that.  I don't see a reason why binder needs to refcount its pages (nor
> use a mapcount on them), but I don't fully understand binder so maybe
> it does need a refcount.

I think that was me, at
<https://lore.kernel.org/all/CAG48ez32zWt4mcfA+y2FnzzNmFe-0ns9XQgp=3DQYeFpR=
sdiCAnw@mail.gmail.com/>.
Looking at the C binder version, binder_install_single_page() installs
pages into userspace page tables in a VM_MIXEDMAP mapping using
vm_insert_page(), and when you do that with pages from the page
allocator, userspace can grab references to them through GUP-fast (and
I think also through GUP). (See how vm_insert_page() and
vm_get_page_prot() don't use pte_mkspecial(), which is pretty much the
only thing that can stop GUP-fast on most architectures.)

My understanding is that the combination VM_IO|VM_MIXEDMAP would stop
normal GUP, but currently the only way to block GUP-fast is to use
VM_PFNMAP. (Which, as far as I understand, is also why GPU drivers use
VM_PFNMAP so much.) Maybe we should change that, so that VM_IO and/or
VM_MIXEDMAP blocks GUP in the region and causes installed PTEs to be
marked with pte_mkspecial()?

I am not entirely sure about this stuff, but I was recently looking at
net/packet/af_packet.c, and I tested that vmsplice() can grab
references to the high-order compound pages that
alloc_one_pg_vec_page() allocates with __get_free_pages(GFP_KERNEL |
__GFP_COMP | __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY, order),
packet_mmap() inserts with vm_insert_page(), and free_pg_vec() drops
with free_pages(). (But that all happens to actually work fine,
free_pages() actually handles refcounted compound pages properly.)
