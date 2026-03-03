Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE533121F
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537951; cv=none; b=r0kgKgVGTfcuia4bnldwsg6DeCJVmxW6EYBQ0jTZd3GTglclgan4xXrdHA8i4W4LAIgx/Gdq+TDdRkkVP0uLFBswfWyaH2/nu3cIPdOIehC77bEtwR2RbJlEHLFbOjxc/sKOREky0Vooa+loc43EHkINaXpSdV8DFKDfIfBe2BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537951; c=relaxed/simple;
	bh=SOkN8YVRNPjTfsz/PejMeq0iowgdTuG0HqfQGfFGgEs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qhlA6aEZ0Q7e36hEgzNRJ473RMwJz8J8hFuDCvU5Z2FIfiCRtj+Zuak6ea4NhQ20ox3vtwsHKFHr0Mu18BRdyFmCSbC4djd4tx2EFHIdYMFttU4VZXNOCs0MuxZ4paelqiwxxF6VKc/YOCTu3yE4TR0xjVywVFZnZsT/ZbgTk18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cvqh1bpC; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cvqh1bpC"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836cc0b38eso60858595e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772537949; x=1773142749; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh33YTVJdNdb4rfed7VKp0A1E6qzkpd9sZhD0bYZ4Vs=;
        b=Cvqh1bpC6d1xy/LrYmXaCBkxgKpotSkzc2Yl8ic9wYiv7bxTXsS6PXwpyA9m9zBuC+
         Oc7YsKkODvTSsE3T14CM6N5fOFFUj/5YjtAjgfmUwew+/6LpYeE5vrEFxiKXfFrKmpv/
         oXZ2lvR7qYbeOzCV9+M7DjSDKrzPJO0f1YkJnl/JDG8M7f+mvMoKlZz3kvRYK+DW6a70
         1Oy+8bkIwRB7F/hI2Dsusg1TbY8pPE8th2Ne6u7e9c1qTiwpgxH/BB4mIrl+7BfbfGCq
         x6uYtoaS2+ctcQFg3nG1RVlqjQ2UYUsTXYS1pbIppd57cKqO0dxdRqBvlAuaTWDZcsL2
         WMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772537949; x=1773142749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh33YTVJdNdb4rfed7VKp0A1E6qzkpd9sZhD0bYZ4Vs=;
        b=siqGoYesCwKgZlMDLlJ0OZuGp8tiYVs6SRNqvNnC6kWlWGEJay3crYydPpRQmUJp0q
         +3iRDFgyEQGlXg98oe+x0VAaL1LCwURRt0DUe094qOm64yqlpMoIBYr8ctnNrRGBIsRy
         iUNwaXAjS5/R4sas0BCgPE7nOuy16q1XF03aMLJrrVEhKf5r7cHApUvIKl7h8nQC8au9
         Q4KClu3EImGcdri+iXOq0BYHMC2FQQYVAUVgIVgO67Pyu1b5KMjRo2W6BxzWt8s8C7Ua
         1taaGlJmkbzGgLWkeIpm9/+EWsvevNtKbK1aXsVy3RlmRMCho6c6dIUWQ9RYFg9B2Nb/
         E0og==
X-Forwarded-Encrypted: i=1; AJvYcCWMkhtbv5t87lkGC4dUO/5i0OQYF33sYzkIKbk22b+6/9O9J0xTMxYqYrJWm9xyypxabVsHImpfx9WCpxmf1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVFIeari7jqsTUgsV4E1yzR0lbqov1W5iQFWqAOUhF3+TXkL1
	0XazAaQzCCYoYq3l8bKdSs2IgH4rtY1hq0l+lv3D2V9MTlUaT3v7gnWoQ77lw4A8fSEkfAJlPcn
	tFpO15rCkga6WbLreAQ==
X-Received: from wmbjv25.prod.google.com ([2002:a05:600c:5719:b0:480:6a27:9ec2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3106:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-483c9ba610fmr259196275e9.3.1772537948481;
 Tue, 03 Mar 2026 03:39:08 -0800 (PST)
Date: Tue, 3 Mar 2026 11:39:07 +0000
In-Reply-To: <DGT2IKQK341C.35HW6HHSB03KL@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260302130223.134058-1-gary@kernel.org> <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org> <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
 <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org> <DGSKLQ9WMRID.3ILNUUEITA48K@garyguo.net>
 <DGSMV5Z3PW5O.3NBTRGX8CK8WB@kernel.org> <DGSN9C8PBFYP.2T48HOEE5LXSM@garyguo.net>
 <DGT16NCR2TD7.27E74897D8XEC@kernel.org> <DGT2IKQK341C.35HW6HHSB03KL@garyguo.net>
Message-ID: <aabIW4RNCgSyY945@google.com>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aditya Rajan <adi.dev.github@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 03, 2026 at 10:17:01AM +0000, Gary Guo wrote:
> On Tue Mar 3, 2026 at 9:14 AM GMT, Benno Lossin wrote:
> > On Mon Mar 2, 2026 at 11:19 PM CET, Gary Guo wrote:
> >> I am basically just having `size_of_val_raw` in mind when writing this. So the
> >> current `KnownSize` comment in v4 is something that I am happy about.
> >
> > Well size_of_val_raw is `unsafe` and only valid to call in certain
> > conditions. It asks in the case of slices that the length is an
> > initialized integer and that the entire value must fit into `isize`.
> > This to me just further indicates that `*mut T` has safety
> > requirements to obtaining the size of an arbitrary pointer.
> >
> > In the special cases of `T: Sized` and `T == [U]`, we have safe ways of
> > getting their size.
> 
> Hmm, the `isize` fitting requirement is problematic indeed. It's broken code if
> pointer projection is used with an allocation that exceeds the limit, but I want
> the API to be safe, so it'll be good if the API is defined to just be wrapping
> and safe (it may return values that doesn't make sense, but that'll be on the
> user).
> 
> Anyhow this is moot as we're going the `KnownSize` route.

It sounds like that's no different from dyn trait vtable case. Fat
pointer must have valid metadata, even if raw pointer.

Alice
