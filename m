Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B78340273
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715083; cv=pass; b=r0KY5VlMYd3MO7mHo4wBpJSHrUgvGbD6cCa9/R999XP4/gbkSFW8EEBRKnKubBlwJIqn0AGuXUG7uyHH7Guqm+fzCFoP2uYMDqkU77/B6Nw0pOJUclMZILVwelpbxPnD1UEdRPiKnLJXOUD2uR9bYRAjotH6ORHIo43JvTG3Gqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715083; c=relaxed/simple;
	bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJBOv3upYYX6v2b7vrPo6bYrXvEp58skEWNy0a59CtTS3dBapVvMM7sei2H16fsqbfe6uNOdMOFcwtKw9nMzsf46mnAvgvkwbuFAo0FX+THumCoeNZnTFjCnUd3OX6zIlnFpRf5FrDe1l5vX6f/ic/0aaXqcofomhfsDc+F9Cvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+ONlH3G; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+ONlH3G"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124b07e5fe4so379864c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 01:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770715081; cv=none;
        d=google.com; s=arc-20240605;
        b=EqcLXSmteNpuhXoczVsaoRryf6GvtssM0sB+zBCn7NoRMh5zlgUugxqfJ9gRHoB+wG
         QqmVnhF+5lrySGLyRfcPDgQjMy8SxE2AaKBURn8r3fgh5ctx18D9IL7bmhkiAJwc3/FG
         hw9E13F8NSwKJWy+OL4m1TBwRmVZFoytbLNdo8tIxPXLqeE6X/fwDuSqIH4I6vNS8U/S
         qy7BSxGkuT8y8eCAD1OXArRHCBuhnEhcG/5mVo0A8gPx1Ry1tw6J8BqVMypWFQ8sVXTl
         HBP+2zRJfcJRYkofuDO6B08PR+BgOF4CTXUpeAuzwM+XLhTYBJlJMRB44RNjxMHlKGt9
         qmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
        fh=6Bto/Ts9kWd/u4Kf7Os7o7tyIgKj1jur1+VBjU4Cxew=;
        b=EGGUQqzjwnQ53k+ek3Okz1gP0594sQzDC2ipkUWGuIQn0Gp9/LYI3tqySMEVXYVIKk
         /bzHC6EUW5QFAhV/uBAXWwb4CPzKllReTI0iaSCpefUE4QraT/9L/RVjmuHZCW6h31OI
         B09MkX5LW4Z5rzG9M3HEAlXOtqOJfbJRZvHIEdlybycmt1b3P+75xINLXvS7tRTJc/Se
         O/F0dSm2mxYLAPZYDaCslJozB+J8+aFLPkerjZRhSvx8VPud32it2EAuAdrdc+Sxo2wE
         Zv9QLb18MbcBUTde/W/XUMiRcVVjaS8s+XgvR3hMGGK7DJgXF94mfVGY4873ggiMNTWD
         7/dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770715081; x=1771319881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
        b=O+ONlH3G/qSP6XaOijperd/UrIM/5cMwRB1H/z69Lri5ONMVUrFWpKlddvXhdH17kt
         VfB0CogmNKbxLA8EzMfOP8SHe9sN02brFnr7LRbIir8vc5/euKeDBjC5NqVedXsLBmcE
         uEa08dt97OYQXab/P74DBYQg1FifJR+zTaYuEK+lIAu7G056N+v6D49EXWQwf/x4yfuK
         kxjLldtD54Bnq6A6Kn0UjdyJ3e90D+KotoaaFl6DcvRGiJBFBqPR6VpenM1AgGfKcuYi
         YMfiy6QOVSDj7+R0HRo1cCp3Vt6qZa+DO5sZtcXozB05IgNuiLZIMMjen/auligG+fpJ
         kp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715081; x=1771319881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
        b=sCErIpKKnkLwWDkMeKRYTSO8tplaHCKULojnrqNv2IVwOiXYUxH+uihEINcis2i2ct
         spx0loAP3MwgGfSw8Zf5jfKNojx90OpSHxZYWE7pnFGB7/g0v5Y7PpEyRhdnptczmb3S
         0eORpaCwc2glwb3m+JPlbkuuWxDBqejUtfXmlhaX05t2GG7zfodoC13999MaQHmH5DSy
         OJEdP27RyU5BRFy6JW1W/UAWGoUNtXcw3ADG4ywQHG/nMS+7ANpZ3PbGZGwr+KYjdgyV
         OrSYiQJxP6NHwd9x/4w0m1EsKdARKflpIUmlcVW/gMHqgdYcmAVlZCsJDgNkTT2wspHS
         zZ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLi9UUVu/mxOylHFFebndXXyfSjsf7sqZLPPbjjj1eUtXFHUrXR7fFqsdXUUaYC6ejXHoYg6dWgamtQkKmAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJn+mRTWFm3hbOZ+V4cTzZfsipc+vRaVaNWQnUbLwJuCBYmBFj
	5VzN+AHjUVZFCkqy+bY9YeFRgI7fAbG4UBXI04hzyL9wT4KaSfWe4WOITl1QLZ9TSWC04RLQFxJ
	2zVvxsTXuUcQVFWlHrnz9eWYH+zfQZdo=
X-Gm-Gg: AZuq6aIzxY0EfCVCQXGWZ5yIs4hn8Lh/FSOwHUAmBBu+BIzNKqD+n0ATt0BwtBHix2S
	UN3U6v8LSHe2Uypub7u9LuyKRZmhcInPJL6FBmfyOfPIpO1GmvqP16dtgw0GDIY3Uk9G75f/5da
	V5o/l35r6BagpQFyw3vwN0WPiVH/nuPU+QhvLn94iLMfeqp3atsigCg4ZU50EbeT1xiadK5jUqA
	lzQR7rcnXXZNdZy/hS0Sf5bggO/mcJAxE2Go6eLxX4zeVK6t0PKJlLR1+rN7vvf+mT46SBrwisE
	9M22FsYrWIj0/zaCeHoGqmRztavipaF7lgrnHRxofbV8SQcsWbXwCYeQqFG99OicdwskLQoif8W
	Lgxg8go82es69YDMWM7iYouaJ
X-Received: by 2002:a05:7022:a92:b0:11e:3e9:3e98 with SMTP id
 a92af1059eb24-1272494f67dmr219752c88.7.1770715080987; Tue, 10 Feb 2026
 01:18:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
 <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org> <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
 <aYrBU52OBCgR-chY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aYrBU52OBCgR-chY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 10:17:48 +0100
X-Gm-Features: AZwV_QjkDsbIYoiftCtGkfNW-taiiY4Gt3cD7LsM0k76oSccc34AX2xXNP97awU
Message-ID: <CANiq72now=ymUnmqV6ckaynKgSW7xB_3QpWpFmiG8Hvm_yV--Q@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linkmauve@linkmauve.fr, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 6:27=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Sure, i'll try to join the call and bring this up.

Thanks! Added you to the call.

Any of the weeks we do it should be fine, but if the time zone is bad,
please let me know.

Cheers,
Miguel
