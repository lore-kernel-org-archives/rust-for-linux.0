Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82863812CD
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557778; cv=pass; b=C3h+jA8qcKazFFDxM0Hp/w4jPn4TvtApWpEWvsMVLH+JwK1usGp4zKBUyajYhZdg5rvdDT9nPZ4FCuSFHSUL3Z29sutJ3vetwsc5FvSs8TPtPS45Yr5vVAmWh7OHSQToBpSkExlk4R7UN6ey1fLOqPwIfcUEi+ralpF8dm3tdm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557778; c=relaxed/simple;
	bh=H3ZJW4HqHiLsHMCxCzHT8BiErgZo9V5ZdQhYfb+38cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oa118WE6EdN7O/wKmhS2SJUjqLkfnbCZbePHQwMIesebQ+JoOy+1gI0q9/+r4aU4Vk0jqvukLCS3bi2trnWA3hJ+xtrKdckPBtZRL+Q7jONycV+4bm469AOwp03E1X8vsTkz+9PdPFCvXdroHA2vBmlzPEKLpufcz7YB2KRxKIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vPjDmxhJ; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vPjDmxhJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2863521f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 14:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781557774; cv=none;
        d=google.com; s=arc-20240605;
        b=AseUhrAwAO1LI7evSZMgBATzbvqZNBiH3SxRqkf3fAacS+zA6AvJZxDv6OgnNTh0OQ
         OJCvehxUCcPbr5SfY7ExHEiRYdX6/dCKLD5BlAajl/qKvXVHljOaGQLHYlwR6nDccUyP
         hlTYnLst4RFNEdD7pILVUtjOb+yH/63nwCTajUotWy5pINZvQakkkuol12BWnS56t4TX
         fDz139TCKXnuvMVEt1M8lGnPDg72iU54NkvWV59HW6OLosW7uZ3zLIBYhaH0mHy+LVNg
         Qz1R9dxBS6DQosdeirxbdBOy/VcmtU4xibnlx6ydSRkuZOKF7UAEDpZjgqOUnNsBZrEM
         epsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H3ZJW4HqHiLsHMCxCzHT8BiErgZo9V5ZdQhYfb+38cI=;
        fh=wspUwBY2aerWsRRsRx7Y4YIkjQ/H+a+Y5GSUUGHZlic=;
        b=aqPDLSvOXBwQvmTFh+raZruZebNJmJAfvof2F2gaiNJgJMAGGfXmcssjXMgZrsrQF4
         BQ7cK+Gu8+Pyew1wY3+HefulXhhjWWypG+vVloRc7lQGPibAGBTkUxlMQNVWfNBKZIYR
         +qvfRWRtskWKfK1PTy3IET7IcbrrAbkgJzuK1+zbZYUuxm0XkCMDB1qHoEcgZy8egFA7
         yYXbZPK+A+BCxHET3h9FmOuAYzrDSydUG/gpQf07fTHLwaSWfblrz9vxxvahocEuGhLr
         xLPGQBqlptI8yxVQmgFKFyXg53gFnfP0p+ksjPW+MqJQLHjeuNJ+LY2SIwiTXpnDQQVM
         XWdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781557774; x=1782162574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3ZJW4HqHiLsHMCxCzHT8BiErgZo9V5ZdQhYfb+38cI=;
        b=vPjDmxhJTL03tAeWOKNFgnbnFOxvlrIhcvCYhTOpuhuzkOWoDLktvFSE/oczbflDlA
         ium46gFT7AtSns9IGYjwym/pSRIxH0mq/ffhvrpruP0nyESZgoNWO3BEH9OWTgde4Bl6
         bBLh0fMiWYDnZzEe6sBYzNmzy44FPGErEvaaS07DWgwmqJlKkcq/dumSk0pBgBcaIXDY
         l6HkdoBTvHoq5UIA1p9e8F0CwqlDtsJqktycV1Y3iwMjpOcJx3x/ZVYAab8LdX7Svhwi
         yWpqMDjoYe0zwllQZWR76qCtCHswRo1bDMu9EeO3CD4PCxqmTrWOm+HJ0jWCz5fDVEwj
         fQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781557774; x=1782162574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H3ZJW4HqHiLsHMCxCzHT8BiErgZo9V5ZdQhYfb+38cI=;
        b=RCHhmcXgdaKB7PvUZK98ATRixQTd5sOld90UvrDl02hoNXMCqnrCLDoq+EiFDNk2VJ
         rKlP7e22MfBWx+8ZmqmvWNkpHSxwuWcnlF5qjjZggD3DiDgMcLsQvGqCAD45g6Y6/5aT
         h+FfGZqH1ztYd+EejPPlwm7/bHXZZIUsayYyMZ5AHawNLC7c2yAwtvtSZN/q78UKHcRy
         hDwBBOvDp9pR2QvXksXrjkt+L8mFvDQruz+ugiJd6HyNfNAKjhwCuidhkI9Pzpn9c9gG
         o+wUjIf8+BivDw/rcw1hdNwszAbS5w1O3Auk9ZIiXqqxMqzw6zCWtheVzSqChh1sXwsx
         w6pg==
X-Forwarded-Encrypted: i=1; AFNElJ++Rv9wFDMTjLAaI7xhd6XG8SmPr3P8GKJMsHICU6tY7ltodk14IybV1AEGDZmK7AKSG4H8YWDjhNJK/O1ndA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyttboCR7WIubvcpX14rSmszJDYaUPiG9dyW47J/JuUeaJ9/wVh
	WRZgxug9peqNwgiYidnVm+vkSDaXn7+LSEby3gZVUMmr+frlxD6mrTQokJ8lcMGyCti7a9qbJL5
	CETRPx6rxp8RdJqcZpavlhdlN8Yqj7p1RMspo3RWC
X-Gm-Gg: Acq92OEZAjvOelc9cO4h927URSxlX5cCgIqDFZn7LHYqBkPKX079KuFZC36gIsagoC8
	qCeeMROrBrSGMVqYXRwGwXoMS52IRy36Q1wp4cveimimKP8OLMG1kwUFU9z4l/DnL/JaVlHDAG9
	JULzjitKZaCycLW66gRum+1n/pwKbXx+YtQokJc27EwW3iDQ04TllPCcRZUosZf04XhbkxSZKfO
	FvKXfVb9l2FaWI25StwCNzz2QsUcEHtp40ZGpLWwa8EfZyEsJ5hx2DTpvKt5frAGddc1V0IKnBn
	vlRQByFYPKhtweVbPcQQvPvq6gjDuyp8HvLR1Q==
X-Received: by 2002:a5d:60ce:0:b0:460:1233:ecf2 with SMTP id
 ffacd0b85a97d-4619f3b4511mr1310797f8f.30.1781557773680; Mon, 15 Jun 2026
 14:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615201737.262-1-iganschel@gmail.com> <ajBiRJANx24mVNUW@google.com>
In-Reply-To: <ajBiRJANx24mVNUW@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 15 Jun 2026 23:09:20 +0200
X-Gm-Features: AVVi8Cfms6Dc7N0zmMsBTohuj53w8Wyll2D0j8yXgqQKxnGDnnDP3vSxmFKtPdI
Message-ID: <CAH5fLgjiyMSordaYS5S73DUKF6czpZtZuPY94j3DYP8XQTXoPg@mail.gmail.com>
Subject: Re: [PATCH] binder: synchronize Rust Binder stats with freeze commands
To: Carlos Llamas <cmllamas@google.com>
Cc: syncrain <iganschel@gmail.com>, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, brauner@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 10:36=E2=80=AFPM Carlos Llamas <cmllamas@google.com=
> wrote:
>
> On Tue, Jun 16, 2026 at 01:47:37AM +0530, syncrain wrote:
> > From: Keshav Verma <iganschel@gmail.com>
> >
> > Rust Binder stats use BC_COUNT and BR_COUNT to size the command and
> > return counters, and use event string tables when printing debug
> > statistics.
> >
> > The Binder protocol includes freeze-related commands and return codes,
> > but the Rust Binder statistics code was not updated to cover them. As a
> > result, those commands and return codes are not accounted for or printe=
d
> > by the stats debug output.
> >
> > Update the counts and event string tables so these commands and return
> > codes are included in the debug statistics output.
> >
> > Signed-off-by: Keshav Verma <iganschel@gmail.com>
> > ---
>
> IIUC, this should have tags:
> Cc: stable <stable@kernel.org>
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
>
>
> But other than that, it LGTM so:
> Acked-by: Carlos Llamas <cmllamas@google.com>

Patch itself LGTM, so:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks!
