Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6732255E34
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771157228; cv=pass; b=MzF82WHynWQPXI7tCMiOAb+j7glU+5Vvi9oq6F1hEqoYlS5Z8iutj9l4fzdP/57ncCPpB88K3wxs6TDhD8NnE3ZR7obeb9f1foKiXBasOxyyfdoQpqwoWFkPuuv8BowTycBTVCmzbd906xLTFS0XGEnMNIoRbeuWBvtFTFoW2IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771157228; c=relaxed/simple;
	bh=xW/rbnUJWJMeKmpgXtNmE9LOkDeTtiHa39aShuFvBsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjEpXOY4mnf3k5O5YRasdlgbBFxMPxcvRL/XOgvpdW4Ys8aMM6M95hHzU7OcOp+Txko5AynP17rh9CQc0ocvnMGV/dwyJNaLJQ3NJ6CuSA13I5CsIzyrJd4wmnO3GNupWZ4TNu955OrgpHy/RCtXmCqCzYLZNm3QJUg7EiQ4sgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sk1GRBOb; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sk1GRBOb"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1273c690e5bso103088c88.2
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 04:07:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771157227; cv=none;
        d=google.com; s=arc-20240605;
        b=Ut/yYYjHUIyVg42suti2/TjedF3rdsLRER2rdllNgYNznB9IrFHnISj9z2OLQmg7RD
         g2cP59WgjfJqS4WSaDLoo0nxkoiPI7+TKNF0K7M0ZjZBj8jkgl5puKLPOXM5JQgLyXaC
         dKt2IKZyrS/Si7VKPogIpbFTiQZX4GoyR/I0ndWMoGdr+eLhSTxSZz3VCbOUA09zkG7/
         r3Ic98SZnQ1oaZaonn1Sn44edS323owsHdY3SANOueCQYjlUI3yfyXhLhA0bkTJ0yj/f
         d+Xnmgz0vKIYBMZuBQaephwBCHj+5mjC8elIcz5CGDnIOnMvq4XmXtFqL+tI8kM2t33f
         Lrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xW/rbnUJWJMeKmpgXtNmE9LOkDeTtiHa39aShuFvBsE=;
        fh=ZpVfVmYIUYF3qWul014R7PUoy0owtsIHNfSACjYZBpY=;
        b=StQCbWZo3dLlv/z3rywd4Bt4/0YHaqCtBHckWno+GeOMMeUU7my/TzPuW7JHwdUXtu
         mZ//ddUolpXprYO30VqQXvjFCNaW0Eodcuk6tx71UdhOPl+OzW+dGKISQexl4BSa8oiv
         ssotoLWHYq6fYHVj6JOvh6FW9hv+X+s9NkYmZ9fwyhRFdpSGKuzly0bKRazgAeqjGEcl
         uf3IV4wdp69ICkhzEG4wYI5qmnTdV4BgOzwMQ62qihRmIuZEQVgdujxNzh0uOJqTXHux
         PaP7TReSSvOTnKkDA6kHqtrVB7n3mqbTL5sbYwKzoG71ciVSm2VN9+SII1UqOk/vd5LW
         cexw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771157227; x=1771762027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xW/rbnUJWJMeKmpgXtNmE9LOkDeTtiHa39aShuFvBsE=;
        b=Sk1GRBObe8IV2xuy3nVBb0VmVt8NH0y8vrVQlSXQOwlU1RYze/GOdn2GG1o3kmNxRw
         +Akq0pSn1SO9OZ9Aj+qXARWEpkuoRoOjK6hao+Tl1XfgyhaSt7iAwuHmkkigWKWn5zm/
         8iikQKBUVyP/A+9esUs6jdjBwxxmGRozQ88aFSYa4SRWoQ5hfEXFgZooGHZ6gJ7BYQtI
         qr1Z6wpEZe5NdvFj+Hw7BKsjnlgAkugFA4VBDlTvDCxYe4FOxofVCapkpCWtItHMwYT0
         6awYtIKuPjE1ODwIWo4Pc8teUlgnM+ePAIVzxXFcKF66Y+PPavU99+2aZ0qS6tbVZ5Xk
         pHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771157227; x=1771762027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xW/rbnUJWJMeKmpgXtNmE9LOkDeTtiHa39aShuFvBsE=;
        b=CQiHJRrI6xjVFo4Z5DVL4T7T395+B3K5SR6M2ElfnwttvOLm/TnvALUyzHuUa5e/te
         Ubt82ii71VrG1kuR7jorgwDQXUlsFb4Zfv2frtuXjViF+AmynGbay4zTThH5JJqPUHnP
         /f9E3hIL1v7deElrkcfOZH+B4+QMAFrs6skU6uvtibXbW27qbfEA2RNYg82hStKD0FsG
         Uvl/OKh9D3f6/rjgotdJoL+ajpNZK0R9/V6+pzTN8A8lKuUP2WRKXia7Uyy7ESlt8apz
         GjMhrjIGB2oCwtmJI9JUpOlrGUiZrOD41JjcKWwVpjqQXW57PoDQnZw+6XMPWCxqzPZB
         +3NA==
X-Forwarded-Encrypted: i=1; AJvYcCXWqYiK1jZ2whRQQwGo+gP9GBMlYAHg+RKkaVdds3i9TVO5rxv4PB1Ctz3r3Fmgoeh1NYWMq5k2r2BADZcjWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE533KPROeqtAuujHMrlmjeLaqs99wdk+478bTgZF9TXZMBusa
	SksY7W7unapS6RqtWkAj6iuua3IuVTn1A+Ay8Kb6jZuPuLFHQflg29xMGkdQc8RdYsyx5weuoZk
	OX4jymcwtJ1sF0Ve9izdyndYZFwMTNzw=
X-Gm-Gg: AZuq6aLRZ2VWroXDbVHhFmWObMWTWx+yWRv/p+E8lCBDH/foVHJkULnh2zG6woVxIHG
	eDTEXZLrhlw39fIf+y1+KqBotx+B/M/U8F+3tgBsYdff2yaXbHEtt8ITiwWYn8Lfw7eB1OOfPYm
	ELvTWFidGFzmJfjerexAhaiWIL12etDubVA3fQoqfQp26wdhzX3iOcw8VTLjhcRCG7KVNQNzqzZ
	j6LQQGeYoRE/y8WzJsthD2Te/D6Alo0tgzPeQLcDOWuBN4oP9pAhhvpXDKPlZ35XHf4lZ0OZa66
	Tz2FW65GHzhkk1fX0g+2XgmS0qZ65BZl0G82hbVCwndkuORrJfNLKmppb/bAkbf178L6L9MyPX3
	TD4hrz8lGMdD3CZInIPdt7Q5z
X-Received: by 2002:a05:693c:3747:b0:2b7:f145:a70 with SMTP id
 5a478bee46e88-2baba0104dbmr1666057eec.1.1771157226635; Sun, 15 Feb 2026
 04:07:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214053344.1994776-1-gary@garyguo.net> <DGEM8AITP519.149B3IVELY7HA@kernel.org>
 <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com> <DGFHJP0MN0EN.254I1QVHR94VA@kernel.org>
In-Reply-To: <DGFHJP0MN0EN.254I1QVHR94VA@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 13:06:54 +0100
X-Gm-Features: AaiRm52lnzfjOhwemdDin9DYZY6b-SJ0wOcSPZMbDw1CLcMfXjC8Xx7wWedv2SE
Message-ID: <CANiq72=+orB+-sTAJHiPQmz431+pCg2S5E9NFSbuh4NNhppfLg@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 12:06=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> What gave you the impression that this should not be properly reviewed?

I didn't say this would not be properly reviewed (I think you meant "would"=
?)

I just want to have a reasonable review time for the first patch since
it is new code.

Depending on the subsystem, fixes go in sometimes way, way faster than
features (days vs. weeks).

That is why I asked whether there is UB "actually" happening today,
because I wanted to understand how urgent we were talking about.

> I do not see any reason for this to be backported, but it is reasonable t=
o be
> included in a -fixes PR.

The backporting part was to mention that you were right that we treat
soundness issues as bugs -- even to the point of backporting. I
introduced that policy to try to raise the bar compared to C, since we
want that "extra layer" of protection and to keep it up even in stable
kernels.

But it is all a balance, i.e. in the C side, it wouldn't be even
considered a bug to begin with, unless there was an "actual issue",
and thus unlikely to be justified for a fixes PR. So I want to make
sure we don't overdo it on the Rust side.

To me, as long as there is a reasonable review time, on the order that
a new feature would get via the normal channels, it is fine.

Cheers,
Miguel
