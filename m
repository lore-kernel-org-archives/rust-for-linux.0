Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBFE2F7459
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345054; cv=none; b=sOU1ax4NVyI7gjewwDU4Pm0HXS9UTbjE1tabqsRWwnCFBBJS1U5MmhvHcURAzZ9e5YNspmfvzkYiA4RfZTwdq5n7ULfGZOonTRtKu9UGSTKHO8TJNTHPPXG5zzjji+4s2l8fb/KL1JxU6cuJmoTHqKpTSs4+ZfpWhV+RbzGMwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345054; c=relaxed/simple;
	bh=CCiwcbz0Xa80/3Iu0vLGj45hC3B+HOSp/IJLkFWl8I0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crZe8VzvctQv8HQfp3F36D1JFpy7qHcqGK8B4tW8O+SamKxdE0sxWbmnS3Eln+bz/ZbIs/MHWeEkcUE7Qs4AKj9O0JYA4snbfjyyuASxQunrfvDXCNnzXrFDAxEl5/Y9SbquNZ9p0Wm1XSoJI04HwPKlWUDoMuSkGLEOKR8+yis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFzSL+Ku; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFzSL+Ku"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77f605f22easo3373436b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760345052; x=1760949852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEm8mSyxrlTqcu1WsEF7ZOgpa+/kS2dzVEZPsYbteWY=;
        b=ZFzSL+KuxWJW5hNFcUUZTqcKt090DExRs4NV9BsWW7oBBGyciz/+hW3vbrjppyBcFc
         hWfSGymMZ1rz8vy6+P3t8oz0Tp9naxxNY/h0965DOCcVHqB2o3UEzKTfw/FjnWPB/Z3v
         iyyFB5d6Dtv5H5KqB2aTZHHejSmSc2aMVBh8Tvm8EIT96dQVMGLDVsHycPgFj3YsR/vr
         tXXSklCvYEXDrJiQbhp4/z1mCbJIBA75SxlVGotuChWshIu8T+QGn4vlDB/JuHz+hDac
         ViYg1kkoqTpIxKz06WxE4qxpXe0RgMN8RdYtGv6Lx8AHLHx8UnOavSuUW6cng+HbYtO5
         6/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760345052; x=1760949852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEm8mSyxrlTqcu1WsEF7ZOgpa+/kS2dzVEZPsYbteWY=;
        b=NkcaLprx7cVnlqnt75E4GLD4TVYUWdbgxaZbH2HD07A0gJdHbdTzDtv0Xz3MHVGvVA
         sOFTIUOiy/n8OLi55C019TAaVx8GCNlKsDFwvfkM/CfEsAUyWqqWTwZ47XnIdu+rmjmI
         WBupXVZmbA/JF9haZPsVOh68kBPrknySt2jahRCFmDKlBIUUmXwFF3iHUuKAlho3An7Y
         casIOX41nXIZ/o4pfya03/krhppseRCypa8Fm8AZ37upXxfrv+bkogE4mfONXPEZ0XKk
         1Cxv8tyC2shSTVSu+mBV1t9oVl+iD7NBjgR69eAVuKvwq12gMjOAQfuU/H7rp++v7zWP
         lD0A==
X-Forwarded-Encrypted: i=1; AJvYcCXyySesMu/mw8ep8H3qTAQNmKNLXAW1mNEXOKSLIolXjFMNcekwV4NpYW+DqIg3VhCc9BkYvaGuCXH3O9fE+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhPaGvZsu9IIh/HOp7ZZaOllpe1zagX+XUYdOhuPenyMFIsnCp
	t9P46j0p6p7Epg7n7cAo82N6KvARjLjsuG5ME5JFz+hAyrwQKBmWJ82R
X-Gm-Gg: ASbGncsWfwGLANwVSbOU7uDpajxN5Km3DcUyBbN6aW6hLaeAfm5C60t8cSUg5jAKn7q
	lYo3yOFz/6YLIOFItpycddheQKHM4Cnve2mJEqAMitNWxENK/15UdyP7KJah6aLqEASElIxPAe8
	YE5Y9eHsnghOl7j/ixXlw3MumiSlC6GxRoemPCQoYTiPW/DEjbRW2pQrj7J+TwH/zX8wJ2o6BJe
	+PY9vsrS+EJL9f7mJgJgMHPW0pKTwTkIFBhGcGkiXpFR3bIZRY5DFXqIb33TZTuvLwwUNE3CAak
	0vmv6VDb4hhIIjzflNMVrd/D64WALehTLxD/ikUb4T/Oq4LXAPgTQYhhuVmGU2dGt8U3AiW0Kg8
	9HeKpk5jIPwTzqbZB+fF9+aYAjH8uDTZBLfbIGdyvGmstRTYysGLCzJJnhA==
X-Google-Smtp-Source: AGHT+IH8BLldBUPUKFQibBJX7aY+OAIgjY1foYAVc8whufp2ZR2zdRzdCGMjbGvERedS1YiA3XEzRw==
X-Received: by 2002:a05:6a20:a123:b0:2fd:71cb:e908 with SMTP id adf61e73a8af0-32da839f7bdmr27396737637.39.1760345052180;
        Mon, 13 Oct 2025 01:44:12 -0700 (PDT)
Received: from shankari-IdeaPad.. ([49.128.169.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm10777474b3a.80.2025.10.13.01.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:44:11 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: [PATCH 1/7] rust: block: update ARef and AlwaysRefCounted imports from sync::aref
Date: Mon, 13 Oct 2025 14:14:02 +0530
Message-Id: <20251013084402.300397-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANiq72=hSTpAj7w8bvcwoJkivxD_FPKnx9jD6iNvhsENnnXBzg@mail.gmail.com>
References: <CANiq72=hSTpAj7w8bvcwoJkivxD_FPKnx9jD6iNvhsENnnXBzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, Oct 12, 2025 at 08:01:19PM +0200, Miguel Ojeda wrote:
> On Sun, Oct 12, 2025 at 4:05 PM Shankari Anand
> <shankari.ak0208@gmail.com> wrote:
> >
> > I'll resend it on top of -rc1.
> 
> Yeah, please, thanks! (in v2 I think you say it is on top of
> linux-next -- did you mean -rc1?).
>
I've rebased it on linux-next, and I've included the exact base commit at the end for reference.

Let me know if you'd prefer it to be rebased onto the latest mainline instead.

> 
> I think it is simpler if I apply (even if temporarily) a commit that
> moves everything and removes the re-export in linux-next -- that way
> people will notice when they try to introduce the code during the
> cycle.
> 

That sounds good. Just to confirm - since this spans multiple drivers/subsystems,
is it still okay to send it as a single patch?

Thanks and regards,
Shankari
