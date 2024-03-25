Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692AF148853
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 14:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711375831; cv=none; b=jiKzZGOdGaPw5GR+A+IBMEBsWPS0NLysDjkxC2KMCx+A/5/W0ehcDEaEq3LLt4pHdla1X7ZMZr8ngXcfzeZMQh73Mpup7PTbu+VXlAIpJ2B5j4GfpoNKlWlpExpyjaZ3VYxjpsl9pdki3RK/4Kw2bg653oogb7u2c5e+prxzPUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711375831; c=relaxed/simple;
	bh=4Kn32RsuIuYn/L+que2osNAj/d2NbRateANJg7z8VJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKD1gbbslub659yRBlp+2GuF2g8YHexeZiv2VrF81e9xe/mYuyFcpdQtNW1jav9pbF+BR1LXCArcitPjyrSH85Fx1ATbvdGZgSxadf/V1RyaKht196eaOqs6lgROBtfz8O6sSkv61KfhkiySjmmTbZl3JKLoWJgSwV2EUtERmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRdlxb9R; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRdlxb9R"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5e8470c1cb7so3021941a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 07:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711375830; x=1711980630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaopeeoIF1ul82xdPQHtjfC6JV6rfK+Sm0ziqY6Hxuw=;
        b=DRdlxb9R5wUjkCwpCpg3HX6htzgE6J1xpjgW+6b5kShM8rgOBaQRsYD2MbaHUv1EdC
         rCt2KZFZWH9drpg10UxxGS3XVp0ccrWuPK3Y5ZdMhqyZ2dWWsCuCFbMLosM6zXAfrJ62
         NraWJcAxiSb9134yKu/JB9t+4Ry/+bBM5VRNZYfzAfMfYejwYBTC8/t7/XA5anXUdeI6
         sHW7x7kubAxUUaANiwgk7IOlWHjAffNCUUUTDs1yvd88pH420bPqaWoifPW8lapB6VoC
         V/GAU16bg4nPC6BveBYqoWnjx+LU7VEEVBVhIkaOkKrJrfym2sf8CEFaOI73emeerxM8
         UV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711375830; x=1711980630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaopeeoIF1ul82xdPQHtjfC6JV6rfK+Sm0ziqY6Hxuw=;
        b=G1BSUTUdzmkL0uw7uHevXwO/bGph1zadn3e2inoWC1UT+Du3ycw11wwDnECetbGa3i
         l4b1UZrRx84lZiOuXh9NgztYpobIhOIHmHuuvnaDm1AFZu5mrTLsCQrhYSN7ebsJGnqc
         R7q4Yy4W4mLQTRl+s20+bBQ7HHr+N8FZsZNFNm00V94Lz/SjY4oA4O3pZu4Ul/jJxNc4
         mr0SfosBpG6gAvDdcIPcOIV7ekIjjk7lo0gswah7We1UVL0Mcsd82tYWxR8zTMquzXj6
         u6Tk4d/Q04wCGZhrxNNagELstq/HtYMGeYKEQ1AOf4VDSvIhPvOGFQh4vXVN4cb1s4OL
         o7vw==
X-Forwarded-Encrypted: i=1; AJvYcCWAiHWzXeGK1lXJXcdDOBL4cSe7D61k36pkrbqY8j5gbRz9bh7SWsSjvNev3kClrccpnhESWWn8gov6tD9cfChmXDrUad3Mi/7CPWBaNT8=
X-Gm-Message-State: AOJu0Yx2V5DE1RM8EFz3gLZ1TWC2IbiPqA+0Df9L08VBm+gd9hfUSJ60
	okA+CCcfG38u3Hsh35NJGcsQbj+oM7Hqa3HO9DUpVq1QFBG9cQYIoO34KMMFMAIdQ+aF7TujWVw
	hNL2u5th+bbeGiUDjqGCOl+1XS5Y=
X-Google-Smtp-Source: AGHT+IGy7TC00XH3x3iAMRG1svJm3PRVQazscYiWkRe9waVxT551fjhrcPo4OhsPdVWOvId8b34lESXW//zUodz4pgg=
X-Received: by 2002:a17:90b:4b45:b0:29a:e05f:3f55 with SMTP id
 mi5-20020a17090b4b4500b0029ae05f3f55mr4711362pjb.2.1711375829505; Mon, 25 Mar
 2024 07:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325110451.42277-1-vincenzopalazzodev@gmail.com>
In-Reply-To: <20240325110451.42277-1-vincenzopalazzodev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Mar 2024 15:10:02 +0100
Message-ID: <CANiq72==OBG+KVJuzW0S5aYowAZ4oq91pk=phRgtedUrGYeHAg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: kernel: types: Add `ARef::into_raw`
To: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	Kartik Prajapati <kartikprajapati987@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincenzo,

Thanks for sending this!

(This is a resend -- apparently vger has had some delays for the last
~14 hours or so.)

On Mon, Mar 25, 2024 at 12:05=E2=80=AFPM Vincenzo Palazzo
<vincenzopalazzodev@gmail.com> wrote:
>
> Add the function `into_raw` to `ARef<T>`. This method
> can be used to turn an `ARef` into a raw pointer.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1044
> Co-developed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> Signed-off-by: Kartik Prajapati <kartikprajapati987@gmail.com>
> Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>

Given what you wrote here, I think you intended to give the primary
authorship to Kartik, right? If that is the case, that would require a
different ordering of these lines (like the last example at
https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-b=
y-cc-and-co-developed-by):

    Signed-off-by: Kartik Prajapati <kartikprajapati987@gmail.com>
    Co-developed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
    Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>

In addition, the commit should be properly attributed to Kartik in
Git, which means you will automatically get the `From: Kartik ...`
line too that you see in the example of the documentation I linked
above.

However, from what I can tell, you didn't modify the commit from
Kartik at all. If that is correct, then the `Co-developed-by` should
not be there (https://docs.kernel.org/process/submitting-patches.html#devel=
oper-s-certificate-of-origin-1-1
has the details).

Finally, for v2, could you please To/Cc the rest of the
maintainers/reviewers? You can use `scripts/get_maintainer.pl` for
that, or the couple commands at
https://rust-for-linux.com/contributing#submitting-patches.

Thanks!

Cheers,
Miguel
