Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0256028C87C
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 18:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772389840; cv=pass; b=rk7wY1DnoAWsWmYq4WKkV+cD/H0CGphVhkUAsFhw1W9XvkjCFJk9ceTYGrvWYRZU9wofz1dYaD96ZlC4OuEfRAbAjCHzVca1THsfbFy8DBT5ermdqiNOCDXTlQ5wkLf88kTwSGPhpka14yIPp/2KHIAuH6OCjsg9ys3ZvoBXrsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772389840; c=relaxed/simple;
	bh=mf01OEyK4IfY9eDptx8tJodJd3WadUls7f/RmOusABY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FLD7AAnZFsXC9B3YO8zrWFJdzqOuQF1rPk9XwudDCkkwUkkErh1p4tbxcR2cAH3SXWHGfW1NdPPmbQOoeORADhe/hOmaPMm1eHpNMd44MJmwgNhf6l+VbAC/HpjcfKz0LvWdkz3Zxp4rNIksBcFBE0dMkd3L9EdBDPxpc5FJzaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHL6tVao; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHL6tVao"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bd801b40dbso268543eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 10:30:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772389838; cv=none;
        d=google.com; s=arc-20240605;
        b=F/Kclx/Ls6N7Yxe1eu1wz5FsqayuSXZDmPSYwtsxArdPLpMq+VPdHag5NlNJjrqJsN
         7YBB9r8y2WyJMwH9hwZwzG8Mxt/p+kAcqdLMYQyafz/fTtSxI++eVqHG9bJ6QhIaxnNV
         pBfoQ3OpU5i+q25tNRQJtY3bHHMroutKhWsUDQ4r2CsQJxV4gOrvnrNpbhqMVQ0i5h+J
         RCFwhktSadfvhuKSyIGcPeZzzhvs5pJh7zVbvx9kpkmx/vljIFA/7uxFQpL4hJtBtoYS
         nKoZz+LO2clWG7gHOFTPoQOJnIw6DAFlsWpKsuLxGfaxl5TuS3KCx1hSWXJszVCIeh/U
         tQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ie6vnc/PwPRyDTxR/odfgAuVxkZjrUd1uYWyo/fGNeo=;
        fh=3TbL3PmKBE2AV9+6ooevAtRioZsq3ZL7hyRH8g3Tgko=;
        b=ITQduUKTiME5NjfyoMep6eeY3Sfp59cWWfoXWNBVIAXs8vPA7jytrIzKo5M8bbf07N
         Ezwh4LQqaZNFEOchEZ63z46XzsV1hBoEueTJnmQelLUyH/T1BJsF+an0fi6QdIt4IFx+
         uHCWxcQG1xHC4jaU+0PDEpoJFW59X3xmRDKv9eRac/r2GoppLpe4w0N8xgCN3QIR8fCD
         ubPo3PSVsGewkYNtvlbfamGX5SMliTiO6yVdQVJRiapj+bF9cZW+nwDfhcDPyBOO/ONg
         QoDsnzh1eagStaanWYJi61AGKxZnacOWj4egIOolEs8ge0mafGrgUMany7o6poMWkeZv
         JLNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772389838; x=1772994638; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ie6vnc/PwPRyDTxR/odfgAuVxkZjrUd1uYWyo/fGNeo=;
        b=nHL6tVaobS/AMyFnPnkU8cJSDGRTut8LQHhAurmc8b4863hZkHNpMey9VZBwFTIHzk
         zw2XbG4aS+4K0zG/RyIuBuOYZ69roV3f2R34zXTQI1DX3tvIruR+7XmOHTgmUsMU4g9a
         bEbJsmeXJ5xbd7HZpSfiHbFUeRY2J5tTNKX51zFo4Mdj4+g/H09979QVOhm6rWtFlg9k
         xWx2F6JOORLd/Joi93GO2ie+5Yrq8U+Iv0Of4jNhCsSuc88DOXxY+D/oBzry37EINrv6
         5NgnbQ+cPbm+kLFMcv0ouV45W1d0Em9m9SJQQoFooD85b/DA3UL7Av5pfUZ5geftk/qn
         0jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772389838; x=1772994638;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ie6vnc/PwPRyDTxR/odfgAuVxkZjrUd1uYWyo/fGNeo=;
        b=EFlOMh8dQfPnClGKsWtP8U/MHC/NfMfvCaUz/mtso1T56NZGPUJBjTMFZn6dcQ392Z
         FIzfVoSWPUQjjF8muF8LFWHuIDTfLBvPoY/IvCQqRoQn2gxvNcjoP21kZl7iAJ79bgPu
         1MEmpZ3R4PaBsn9IQJRd4QVzF6AQ40+07fbpvQlb7P1kbDyHlt0yoUeYBaXyOAnhu6f3
         3H9BnBtGQ3XsgD7m6YZebiZZzPh9Ul2m0bPDl+PrJzxTEOmyWLGhX0vPoW1/LTEwngMC
         hZ2C6mGnbS9fi8ougzLMUQLJzafAk2sdrF5JzbeXYL0KcZFPkxW37MRLSCAdHXaueSzy
         nWAg==
X-Gm-Message-State: AOJu0YyU9Gax+wNJofBuLdk8r1qgDTET6O5CYdaMU1K0VzXn7Tp7ynUS
	J0SOHx15L+nk64biwkC+u1ViBvEBqIx5E3m6SC1mGJ1eSzBK9k1QqBf2NvQDSrOdC5pCmCPhoXL
	ihsql8dE6BtKAvhEzhrpj8o1IU2Nzd90=
X-Gm-Gg: ATEYQzw/dSmkJ9j+7bxcMRjvgKQ9X+frtdldvM+St/pJMHeCpFigJoU7ite2zm81AP6
	VeZisi0LfYNmmYg/YWpY/n3MxiWz9QG+VaoVslmSRPh16qpIu6bWVvvQwBK35Mz8oID8T2+WjQ0
	bQjEMMbCJAAnMysq+Tcu5USVw6g4vUp3UN54+2ky12SA5gT5q/PVx+7WUgup9LCRNjlntiO7NPx
	j55Ge7+2N36qillsWGFTP3naviJlETqb7McNykHmE80DG/LLjkSzP0NvAsQLw13IbzSgOotMg+X
	BybDekXl46Iigoq2kfAeceMJqRHo3zFS5lFjtK/PEfuJe6EyiLNNhiKc3L39+i+afUyss9WMl/O
	yJ5v3l72bR3qEzxBvy1HAWI/oLKqx
X-Received: by 2002:a05:7300:bf1c:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2be140cbe97mr13223eec.2.1772389837806; Sun, 01 Mar 2026
 10:30:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 19:30:25 +0100
X-Gm-Features: AaiRm53HBiFVU-jXo3nTSjOptnSDwIXStO40MSeUWT7xN1xj4jrTli-f0OKAm0Q
Message-ID: <CANiq72nWYJna_hdFxjQCQZK6yJBrr1Mb86iKavivV0U0BgufeA@mail.gmail.com>
Subject: pin-init Clippy nightly trivial warning in 6.18.y
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Benno, Gary,

With nightly Clippy in 6.18.y, I am seeing a trivial warning, which I
am wondering if we would want to keep enabled or not, i.e. I can see
you may want to keep the `nesting` value check inside like you do in
the nested `match nesting` below that one:

      CLIPPY P rust/libmacros.so - due to command line change
    warning: this `if` can be collapsed into the outer `match`
      --> rust/pin-init/internal/src/helpers.rs:91:17
       |
    91 | /                 if nesting == 1 {
    92 | |                     impl_generics.push(tt.clone());
    93 | |                     impl_generics.push(tt);
    94 | |                     skip_until_comma = false;
    95 | |                 }
       | |_________________^
       |
       = help: for further information visit
https://rust-lang.github.io/rust-clippy/master/index.html#collapsible_match
       = note: `-W clippy::collapsible-match` implied by `-W clippy::all`
       = help: to override `-W clippy::all` add
`#[allow(clippy::collapsible_match)]`
    help: collapse nested if block
       |
    90 ~             TokenTree::Punct(p) if skip_until_comma &&
p.as_char() == ','
    91 ~                 && nesting == 1 => {
    92 |                     impl_generics.push(tt.clone());
    93 |                     impl_generics.push(tt);
    94 |                     skip_until_comma = false;
    95 ~                 }
       |

Anyway, it is just in 6.18.y given the `syn` rewrite and not urgent
since it is nightly.

Please let me know what you think about the warning overall and for
6.18.y we can backport a targeted clean up.

Thanks!

Cheers,
Miguel
