Received: from sg-1-22.ptr.blmpb.com (sg-1-22.ptr.blmpb.com [118.26.132.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84B331327F
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762350379; cv=none; b=B5gXoD3vsBN+PbWOYF58NdOc2DjhAGCs3cNn7scQwg4HZlWBVGIi6/9zxZOiWsLmMkf+CwuVCcMxu/vSq9ei7R6NX6tpXZvuR9CfKbvM0nGXHA2DUjA2wmwdGMpVUat8vWRYNFLuuShkclI2Gq3f84QlXEokDeQiP19nTzriCvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762350379; c=relaxed/simple;
	bh=8+E+wvcxBVM0MPG0WH1f2Ay5kSxXX3yb3qO1FxQOTls=;
	h=Mime-Version:In-Reply-To:To:Cc:From:Subject:Date:Message-Id:
	 Content-Type:References; b=N7IBbhAT2xw7xHd8HxBwPpsSs554VFz4d/87O7dTekru14jpPKvn1yC+a0zevjqxyIB8U7mGYCa8/iS+uC0FncXR0pObGOVkczAeDk1MZlVlJHsokMQdUEURUpLfnSniXnrGTnLbTE2B/hgrOaFMQFfiZjTEwqPpWpO8fN+lODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=TTxyY3lE; arc=none smtp.client-ip=118.26.132.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="TTxyY3lE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1762350367;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8+E+wvcxBVM0MPG0WH1f2Ay5kSxXX3yb3qO1FxQOTls=;
 b=TTxyY3lEsgB/ruiv12o5h9soSJW+ZDCU82keg4+yJJctTVzAv06sP3lQ4f3pUi9pGZf+kJ
 70W8OchN4+pHhQ0bOCiosqc9Wz4cSMZyURaI/ED8ZnKpMYF3F/7nSWLUozgxFCYG3cjj8p
 iCLlDB6n39Fziu1w4/s3i6WPdtuWSOoyyUfTjxiyNZKJMjhScIj0vPTxui6txfHJs7HDUN
 z2WGKlga3x4pgkX6lrdoZrguKykgxDy9ur5GQ+vp1itYOYMc6dhaSkPW/+gQZ1hZmJpBuI
 JE+rkDmp5XKCk1NO7xv539CkHx8mh5oiJ2Tuw+WGn0xZrjNuNrvbzsP0uPaMrw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+2690b551d+de204c+vger.kernel.org+chenmiao@openatom.club>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANiq72=OE3JNpemanR-r1efbgKqQrZCiQ7hY2-=_bvxLyJZ-HQ@mail.gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, 
	"Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	"Benno Lossin" <lossin@kernel.org>, 
	"Andreas Hindborg" <a.hindborg@kernel.org>, 
	"Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, 
	"Danilo Krummrich" <dakr@kernel.org>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, 
	"open list" <linux-kernel@vger.kernel.org>
From: "Chen Miao" <chenmiao@openatom.club>
Subject: Re: [PATCH] rust: kernel: Support more jump_label api
Date: Wed, 5 Nov 2025 21:46:02 +0800
X-Original-From: Chen Miao <chenmiao@openatom.club>
Received: from [198.18.0.1] ([114.249.49.233]) by smtp.feishu.cn with ESMTPS; Wed, 05 Nov 2025 21:46:04 +0800
Message-Id: <282bd8d5-afde-4a96-b294-bbd7b69ce684@openatom.club>
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
References: <df3a68334760b2b254219a69426982bf858dee39.1762221537.git.chenmiao@openatom.club> <CANiq72=WZJ5=UACpFLWCVJ7mcXbc93X9MyYAZP8-0F==2b0adw@mail.gmail.com> <8d865a46-82c8-428d-a371-407889eefb62@openatom.club> <CANiq72=OE3JNpemanR-r1efbgKqQrZCiQ7hY2-=_bvxLyJZ-HQ@mail.gmail.com>

On 11/5/2025 9:40 PM, Miguel Ojeda wrote:
> On Wed, Nov 5, 2025 at 2:35=E2=80=AFPM Chen Miao <chenmiao@openatom.club>=
 wrote:
>> I can understand, but I'd like to make a brief explanation here. "Chen M=
iao"
>> is my name, so the prefix of all my email addresses is "chenmiao." There=
fore,
>> "Chen Miao" and "chenmiao" are equivalent.
> That is fine, but what I was trying to say is that, in that case the
> Signed-off-by should be "Chen Miao".
>
> Please see https://docs.kernel.org/process/submitting-patches.html#sign-y=
our-work-the-developer-s-certificate-of-origin
> -- thanks!
>
> Cheers,
> Miguel

Well, I will follow this rule and change the Signed-off-by to "Chen Miao"=
=20
before the next push.

Regards,

Chen Miao
