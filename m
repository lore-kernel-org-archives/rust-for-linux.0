Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD633A719
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868907; cv=pass; b=Eqotq3kI6jC2ekKcg0Lc6I15FcGR65USxdMCL50H29/N0Fwt/JXNsnRc1lAG7Wa5WuvFeQGxzK2YWMyssXU/ruQyhTWCK3dsLi4neBzaakqisE67Je8ci7bcHJrqqRzbgPjxc3PdmZXROKAGYoWbhuYTntQprxACRXlEFHVAcZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868907; c=relaxed/simple;
	bh=AoYn0yFpwz10cwExt3RnafbWOT5+DafJvEoxrLpXtWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gs+5wAa5O7GWwdTqg89viApYc8LG1qnggHHaBsB0XWgEeOGwza4DlXbWtvQyKaZeTuRAZEOtPIcEZLsU6tdIgQ0RUE9qEZicPv9UXyeV49ZImDo4w0dc2inEEYxtdkPm2eN0r+A0+DQu/OOxhnk4Bo24ynJWwq05Asyh+ciCPac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQJr18d6; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQJr18d6"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2baa1ed79b0so125612eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 09:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771868905; cv=none;
        d=google.com; s=arc-20240605;
        b=R0cgkniLqSBV3g1FwAnZQ75Os8ZAmZ2YbUyae7MOvv5rjslVi6A25swFGMBTqkGw0y
         9CoCFCdYaXyJ0pvkpQIpOpmzrKPCcrkOH8lzU9XUDosX5jUekb7VUe4AnVcCh1ql6Qpe
         zcR6AzQHFtoXOUmImbCHaXbX7UnPgH2P+36Ab7z9FEGliEpkCHoL1m2EPMNSH+hItZQY
         B3D6hHkIXv7waSr+ynlrJ9Xy+XCpZ07TGEIxGwN2vaLdMkwmay0EgS4J48x+hdNT5X9b
         syvou0nM96ZL576NrLHNzhdxnXAPNMqb90yN7tM3cTNoMd+nZrJKksafNZfdho9VCoh1
         gi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=euw0JHqcmS+ppcTj8AUJZXArv+sJffQNQGM/GEcKb/Q=;
        fh=TYCAykgt3rhLDigzkokS+1eWH4YJs2dewfxyYGrW4Go=;
        b=Jyo7eYyEbAzlMpIEqYOvyQ9Ozo4BNDu01iJAbRD/Fx04tyYtS1Pv61+PatikbIOVGh
         jFaKQt3Q+zkmQHZw0FGdlTKNvnHk1qxKg1I8Vb6AXt2ibunxtFqGhm13gTwResvF1cnm
         y/nCEpBcZraBaNYhd8tNzVdLoC9NnfbnGovg5tWwpxifhuFeRfQOkwsd5C808tc8/hTT
         C73TqN1RMZDGps+jl1gqXWaehURp3/Qpm3nTeQJ+N6ASMtMonl1TScMckdYx3gOdoxSI
         ZR554EFw05gjq1wDrVB/RTXDjJL5UZ0SbpdxJHQuywrqLA0GNa3nRjWBvhpp/Pli4KUM
         yqxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868905; x=1772473705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euw0JHqcmS+ppcTj8AUJZXArv+sJffQNQGM/GEcKb/Q=;
        b=IQJr18d60r/F/kagqaPX7yAbanB0YegGr3fPOUknbNB+/RI4Lv+4ihbHZQfBjcH1bF
         fMLKtZhfNg90naLo9epuWGWsPK6nxKbgSlM4GpjyCkU37eKXUn3BBUU8pXsWmlxTeUP7
         68fhNTwYBA97f5Uut/vognc6ox1pjBsl2S2QewvY20oWenkzattJh+bHHlQpdPEnDqel
         as96VKthO6vMMR6R78uHGuhwZkSZZZIaQJDO+w8okAsGFz7khjWqR/0npg0mgMw2m08S
         bcBRLI/2dqyyQxrX690jHpDkf9YQxQMAxP1L7y3y6zy9+GgDF15W3LvJW7Srn2vPP+AR
         8m3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868905; x=1772473705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=euw0JHqcmS+ppcTj8AUJZXArv+sJffQNQGM/GEcKb/Q=;
        b=OwHW+Tn11wG64f8DSoo4VpGo00PZ9WZqjd9BeTAuzGSTCJIStPd27eTjgUR21Fgiyj
         WV/RpAVFyEbf3u7N1Q5lbuxxrqgMdqstwGcI0XvnWJjcWq8vEZyfcGGu/32eVt7XOwHe
         GVTf/QOxNVhyvpk0DORhJWxG7owx8jx7MgzsO67e9Ff0WxZ1uLHscYgnO/ERn9g1qpB6
         FBPZA4DmTGI+OwX2e7ikhJHyFMMIRAW33kgvJphOzgxNHhPYEeSLsxO3JLqgdGl3KhNL
         DzJDKM24UhipQIyolG1iFkyMzkqjWNaQmQzcjMPQERy1zblWILut3mdUmjbcp4CsnAKQ
         /8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFGjZuwuvewHFTxR3gbHiaiYwgPD0PY50hqiZXo+dbbcNDRx1l5W6S6LqCBBW8AX+7NlEmCm5WbLGgqF+haQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdnNQVhYO+JUbltwFSu8Vl/7wZGED/FqSV7z4DV9feM5LJyfA0
	PNRH2LKQSu9FKVJ1ySbpBBH65MvNP5UlrqOiC9Ma8S2GnY4lOXQYKTBlr+PYkq9qKMLFJvsc6xt
	63HNGVLiem4Ylsmz//KkJoxAg2nA9c+U=
X-Gm-Gg: ATEYQzzLBqzezzGsh27BsbwvYVUmQ1grjfHDscWTcAVlEhnSx3DzZKyXsDQpYOO0GL3
	/12WMkQyoR51EXhKmIpJxSYW2qlHT/wHDimbdIz8j3SDma3yeNF08wwhI2+pCnRutjLgUkdQSrc
	qvlU+u0XhgNfecEb288h0fSeaoB7Oi4HlBhcBX32qrRlRrlyEYM3ZTCfVZAc7Vb/B5252hGUY7b
	+phofY0EXQOtGefTEK3gyaaqAWZeD7h4lHGXJMUaJtjyB/DP104bPeqgFCjZNDoMoBR7lw2n/qG
	9Fpspc/6fe7eAFO+dXdWK4QikPWxmf3FZT1eo6oRnjpSet6e1mtwBJlEUVPxliHTnewmGWlZXVL
	iRsjDxVa7WGR4Nj50Jp2PE1Ff
X-Received: by 2002:a05:7300:e207:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2bd7bdaec84mr1888941eec.7.1771868904780; Mon, 23 Feb 2026
 09:48:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216131613.45344-3-phasta@kernel.org>
In-Reply-To: <20260216131613.45344-3-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Feb 2026 18:48:12 +0100
X-Gm-Features: AaiRm52IsjI6CwbLcieZsME5VB38JLQHKnKzKp5HwF2Z11wo3cc9U_53Axmcu6E
Message-ID: <CANiq72kEwVVja4u-zqk3ubqrV4WMFihKgeUAX4ey19gW6BoXpA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: list: Add unsafe for container_of
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 2:17=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> impl_list_item_mod.rs calls container_of() without unsafe blocks at a
> couple of places. Since container_of() is an unsafe macro / function,
> the blocks are strictly necessary.
>
> The problem was so far not visible because the "unsafe-op-in-unsafe-fn"
> check is a linter rather than a compiler check. Rust suppresses lint
> checks triggered inside of a macro from another crate. Thus, the error
> becomes only visible once someone from without the core crate tries to
> use linked lists:
>
> error[E0133]: call to unsafe function `core::ptr::mut_ptr::<impl *mut T>:=
:byte_sub`
> is unsafe and requires unsafe block
>    --> rust/kernel/lib.rs:252:29
>     |
> 252 |           let container_ptr =3D field_ptr.byte_sub(offset).cast::<$=
Container>();
>     |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^ call to un=
safe function
>     |
>    ::: rust/kernel/drm/jq.rs:98:1
>     |
> 98  | / impl_list_item! {
> 99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links=
 }; }
> 100 | | }
>     | |_- in this macro invocation
>     |
> note: an unsafe function restricts its caller, but its body is safe by de=
fault
>    --> rust/kernel/list/impl_list_item_mod.rs:216:13
>     |
> 216 |               unsafe fn view_value(me: *mut $crate::list::ListLinks=
<$num>) -> *const Self {
>     |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^
>     |
>    ::: rust/kernel/drm/jq.rs:98:1
>     |
> 98  | / impl_list_item! {
> 99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links=
 }; }
> 100 | | }
>     | |_- in this macro invocation
>     =3D note: requested on the command line with `-D unsafe-op-in-unsafe-=
fn`
>     =3D note: this error originates in the macro `$crate::container_of` w=
hich comes
>     from the expansion of the macro `impl_list_item`
>
> Add unsafe blocks to container_of to fix the issue.
>
> Cc: stable@vger.kernel.org
> Fixes: c77f85b347dd ("rust: list: remove OFFSET constants")
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

(I said it was applied, but for completeness, let me send my usual
message here... The commit is in mainline already.).

Applied to `rust-fixes` -- thanks everyone!

    [ As discussed, let's fix the build for those that want to use the
      macro within the `kernel` crate now and we can discuss the proper
      safety comments afterwards. Thus I removed the ones from the patch.

      However, we cannot just avoid the comments with `CLIPPY=3D1`, so I
      provided placeholders for now, like we did in the past. They were
      also needed for an `unsafe impl`.

      While I am not happy about it, it isn't worse than the current
      status (the comments were meant to be there), and at least this
      shows what is missing -- our pre-existing "good first issue" [1]
      may motivate new contributors to complete them properly.

      Finally, I moved one of the existing safety comments one line down
      so that Clippy could locate it.

      Link: https://github.com/Rust-for-Linux/linux/issues/351 [1]

        - Miguel ]

    [ Fixed formatting. Reworded to fix the lint suppression
      explanation. Indent build error. - Miguel ]

Cheers,
Miguel
