Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B83AE1BB
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785745425; cv=pass; b=eOFmGsJqgbU7x/YYTaTP+2vZLQdxBJqMspoPDGv5Qiu4udlJ31Ew5Ufdn5dLHkbqQP0G/yIeyyifVu7kqPvw9jZ4NWl/LS/s6dHLmaeEBqI9DFqDWyx4ORiIA7aoM3QSViRwNb3oGonxTXc/ZPy0td+UPawuni0zkF7YBoaOOuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785745425; c=relaxed/simple;
	bh=0QR8l089L0woPHK0XcInnRSEHmw2+gt/o2h2naGYpD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDmZ/cB2qhF55+ERNBnPiPyFFkLARrf5YAEAphXkZ1bjz8soMBtYdG1oo/VLR/o+Y9L808AjtZlOia6Iq4o4rmpcQeV+oLy5sGRhxR2bRnfjvUdbtsHqOVlRxfL4aIWdQGbDgzfTaTgMRHMcWLVQB7zRrPqHfRW/juWF7a/rbT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngWLoAeI; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngWLoAeI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d049069377so23492985ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 01:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785745423; cv=none;
        d=google.com; s=arc-20260327;
        b=TGN+Z+OEj8B6dkkAo3GQ3bppiKWFLfzCc2amzfxKJW6J2kttBTiEDUwzIYBo6LDtSw
         WEY2W26nAhQoq/X33fV4+SdbzXWCAMc+vBMrbWIW3TuvJKszj9/qzmPOKpmAaL7vedMt
         Fh5SXIzlCEdScBgFTe6gfSnnTGR+eB/EL7XWgPbc5lOgRWlPTfOxwoV1edyTrZcuRK8K
         pw6O/CFCku2SSQ7y5V71WHZXN9S2oYI8zKbV32awaLpFtJpwlXbtdd+tm1vnPCtrEkxd
         7h5Hi98CRcFK5NjiNIUAcNQ63007FxT5rUN9v/XeUI9bhr4rhmYzK1B+v5ocQSAjCg6z
         jpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jscwq3Z0b/da+fcXi9eQfZwtlQcb11laQBeUXf916eA=;
        fh=Oga23rs/G/VWbN8W+3Qh/1oT4nLJtwuvS4FDJ199lnI=;
        b=CkURFOKOE1FQhhqA5XuPQ41+Op9m4KiiY2f099Q/7hV3iqeDP5pu7IDWwzFg1T4Zpf
         aE+khLCUUSEg6ZV7DrSXHd1miVMu7HoIO2SoEV5k0ZqE32K2casMoasWMPkzzvhFWjLH
         SQk5ZZtQjYDvR8GEPoI3BSBJS+WiLxk+5KXx294bwOm5a2WA2cUvC8Rxkwdo5gCkPzS5
         w0A/aHzVoOMXONawwPgy0zvMKI/DplRFo0Yj+TtDDlp/xJEhNHTfMQKfe33WcHVescZK
         ai1zZqv0yGWgnwrWQ8EPKH+jcV2bx2rbKu85h88k2riUDWFwVl6iVUWYwubPoprYggU6
         07ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785745423; x=1786350223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jscwq3Z0b/da+fcXi9eQfZwtlQcb11laQBeUXf916eA=;
        b=ngWLoAeIFAoxCWjpPKrjSWyDt0POalJLQWx5F5LcIy4XrM6BfRMTuGvBJFf8vInE0+
         pwl9gz9XWukqJqJz3H13uW44o3j1DeUaciSDqbgKhkBdoUrciubdMzmesDMhG8HI6iWl
         kyHoQLrdXA9aKiiAMRwolzrULDPdZywXAcdSJc2Q71U0Whna+0HLzQZyH2dGfh/fo8Fi
         8S8cDL6Il70hbose8aedKGUj+hH62troiQr7lbJ33jdHyZ3U6qjqrKoAFyCxYI1gQFxl
         Lf3bS2hZwN/cdQQVjKGsrSmIfd+pulkueBHULZYOC3dqMF93MlUpZdCSoQ1RbUI1BSFT
         wItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785745423; x=1786350223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jscwq3Z0b/da+fcXi9eQfZwtlQcb11laQBeUXf916eA=;
        b=eA26YHNozXaP7xrUMIJ3LVIanV6NkMA8+Wzw1BVVnxAzALIomC+d9J9HbdDTikOjz0
         HRSRf65EhJwVQa/l1gFHlDn59d5D5AuTwcHt6By2sGyw4dNKE6DRXiObQ004UHKtgl3D
         oIcvyYFPawzVJmipRCy2CoSSkKM6i5XDa92oQbJw5trR65c2AO4eJS8nh7y38GHKk/ML
         paiFS+BaUl7lr51Il2JSUUxbsBs10jK1hlh32LFyQcbkE6TRjXjLx9epBPx3G5wsAnjZ
         jMQBFi52R55tF5oy7fU6TVqMPktWR8uVHmP0gpUTZPeazQqmGTIqOkeSj3DKPCXezz6a
         RSbw==
X-Forwarded-Encrypted: i=1; AHgh+Rof4Xnsw6Iw8UdIeWoYRG27/Vt8KgxFilr86/ktoc8AANugIM58wwyoIwqSozFC7+70Yz/IuxKGkf40QogyaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Sl/AcKqNofCf+NOQFdRq0HiW2WOxuiW9wMD9KTRQOfn0RNyO
	9MdH/zH7AcfOKQMByqHCl13d7jTSkAmW/oabUI0+mpwrP0E48yjzpQ/peHHLW2XumKjQCqedZQt
	1rVDcg/ZNkZtG3DvP15z2IaYmam+A9pU=
X-Gm-Gg: AR+sD13EPO2tgkpxN8FyyWl+QdkOGqVMFB2l8Tu7fZpqTPDt9+B7f0mHsMKRT2ODdPP
	PIr0FWGilcSVonRVWFxx1yVErEBJpv0YsnavFr1scPOBcqYf1fm+hS5vAse37MN/GnJHLYsDF4N
	Vj/PAzDnDWdpYJ3JwSzx30oF2+Q+F9fbUaZS8UvjimeLKpO4MqyxGxfGvo5xUp0OA1CmLLMC0Bt
	7XiZqgNcjqpb+ETmqf+60Q4uNmDVXYbHuJOSMq7DnF28ZhzR+UMTWqP9NUHb7X9qZ9/B3wVp6dz
	Y1TQE6Ld+efhApEEEOtBb+Z/cr901uFgi3Cxv9Nbau1aVo+VRCx8x4dj3tV/B8/SspZqONb2k10
	J
X-Received: by 2002:a05:6a20:c996:b0:3b3:2703:110 with SMTP id
 adf61e73a8af0-3c92a75b1a2mr9309844637.4.1785745423141; Mon, 03 Aug 2026
 01:23:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
 <CANiq72krLhYi_vQJjKcEhiQP9CHwc-+d=iMZocW19+MqfW3qwA@mail.gmail.com>
 <CANiq72mj+A4PujCsMCWErASkQbG-ieiXqUpQfozBwhaVgWmV8g@mail.gmail.com>
 <CABwQupNjJCX3DqTjyG3o6wK0NktgrgwSPCWe3YLBx4BsZ+FwLA@mail.gmail.com> <CANiq72np0GvNBMmvzFSfYAfPWVgpVUoD945hHwrat5bQcEJ2vQ@mail.gmail.com>
In-Reply-To: <CANiq72np0GvNBMmvzFSfYAfPWVgpVUoD945hHwrat5bQcEJ2vQ@mail.gmail.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 3 Aug 2026 10:23:30 +0200
X-Gm-Features: AUfX_mwdMh1ggp9AywOqx_iZEEWdCLKFcE-YrXqvAIed3XGYBQcwZFXWPs4vjoU
Message-ID: <CABwQupNSuc9M2am=b8=6iCNKYjjKziZ+XvWAvqBT3ftROsFF-A@mail.gmail.com>
Subject: Re: LLVM 22 needs bindgen 0.72.1
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:07=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jul 20, 2026 at 11:34=E2=80=AFAM Burak Emir <burak.emir@gmail.com=
> wrote:
> >
> > On Sun, Jul 19, 2026 at 2:18=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > >   https://lore.kernel.org/rust-for-linux/20260719120514.159914-1-ojed=
a@kernel.org/
> > >
> >
> > Thanks for taking care of this!
>
> You're welcome! Did you have a chance to test the warning patch above
> to confirm you see it as expected?
>
> No worries if you don't have the setup anymore, I will apply it, but
> it would be nice to know :)

Done.

I also ran the updated cargo install command again (where Nathan
removed the --version).
As expected, it replaces bindgen with 0.71.1 with 0.72.1 and the
warning from the rust_is_available script goes away, as intended.

Cheers,
- Burak
