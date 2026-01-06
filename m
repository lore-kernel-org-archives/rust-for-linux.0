Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FFE2C11EF
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 20:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767729693; cv=none; b=UzxPiaL1XEJQZI00w1r3YaCfkx9Ssx3s/IN1deH7ic1R/2JoiPvId0uOehupLnACUwYddpK7k6avL+GnssOBIEq7S+xu768ufisOZ5Y9eg1w+SqZce3s51+PfnQZ9ouhOv6BXQ+OuVLeOV+Ub7UJE8ZUu5EgOmrCYh337w9j2GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767729693; c=relaxed/simple;
	bh=Dt549mrUZstAPsKfNJENULJYrTj+LZJNEJkKzB4AD+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZJtb4LJL1TwcVS4E/cybbgPEWaxcemdgX9Jh34ugB5CcTcf6YrcGCgTQyjkS9RnIBXfEWfCR0TZWxI5jYmT58IEe3sQS9b5X580OdGSNmab2kDBeNPKJjwYtkYKCq4kqH8BSkycB9v73LTIX9EtiJLtusSGATjLN6HU956NVGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arhZVoBL; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arhZVoBL"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-121a15dacd1so70492c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 12:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767729691; x=1768334491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGV7wWt6S7LagMiDdKmY0Z14bkvoMGG1QHstzp9zIvU=;
        b=arhZVoBLSHgyTGMK9QVm2AQCIZwQD4vy5cAY098wwqKgp/q0F8MWG2fKjT14dRo545
         2FMF8jsH2lHa4S4HB2iQVCXaD5s1FAfZemt1Fh5lPipLJnSduqsNLFHetw3I6hh0uHXP
         jc+KMaKG5RztFIzYHjn1d+zCqyyUSf19LSY4iNjjgYEq13VokekR3wirv9lQ98QLHRcn
         iQ+4AaokPEewUD3xyAelv/bs3PPdos7PXcfHk967D9Af3CYkeGYXrIpeTAwXjZE4vAb+
         tytceeMmm3IYAfF4QVeeYJ4yraQD19QMUz8vxir3RJpQ8+iUi7CYiqjWlu2vXcPRmeLz
         BVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767729691; x=1768334491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BGV7wWt6S7LagMiDdKmY0Z14bkvoMGG1QHstzp9zIvU=;
        b=WuYYvrvgKJJ2qeAtI1MMJiH+n2Xnt2Hgmv8eWCZQDdbtQYzjaFVKYhC06LOn3PksC6
         y7sttEt++yX5OLab+NxhIrXI2B5XZMnqXNd34YxK4izz/GqHQfqI46/JW+TyXt6HHcw4
         wqhA1lfug7/jJsZM7pVeJud8nbowP9riWg4vYU6AUrFr71752FMh4d8d4YrNh+vv3xkf
         g0K6DlwJphr6mBGmtZfgsgw7wClv9a1u5lqu8X0sq5BB19liu1ZYsGqRaitFOADdIckv
         StBIxYnDaJP3RZ54qPJHKfRfxkMj/1dDRgW3mG98RpARs8fgFhdJgKGJtcdXrHiE0saq
         Kheg==
X-Gm-Message-State: AOJu0YzS4PaqazcZkFsnDX9wNxIO4NzlGg6Dus6e6c4qGenQJw9YiSHC
	VFnFRbBmptCcCx+/NhXgVs5pKIpcvgo5ZN46sY3A3i/2DyaSIm4s34iMCfx6tKBLximKV7+Nr7x
	UVyDrABNSeOEtXOu+9qHA6ajedY7uAh5IQFrO
X-Gm-Gg: AY/fxX5FyqfP/msJKbU5lNhD5whLlW4YUEMIiBf+u59ysqTvV0g+Ghewa9kylYfXCr/
	ZMZUIZYGP0H2niWp31RLiEjabyTzj/IjYpZlm0ishX8zMcEpPHs+HtI3Md5SGbhBENg43M4JJHK
	4gSOeC1c/eX8tThWDZ55O2HzNpU64zvBBDitVpK4GgzBcg0uooXMQd7c/xPjild/Cht5xKiZmOX
	QU1+dgQcxuKrOhV0jy1rap5szQq5r1CCzP2ekUnfrvZRLW5lZgGtUc/0awqaJ7ljd2lDLa8CVmP
	AS2N/GFYfN2BFuPpDEYHyHyFQ7isvBHy1iMV5aM4yxDaC6U1KdsczQL8Y5qyHMS27AXTf+Rh5d7
	cWln+OxvUyQWW6v1BRTDynjo=
X-Google-Smtp-Source: AGHT+IFSOhN+iUfgS/YG/37q1BSianexajuG7E+qe0vvmDLBMRpeuPTZXEk52DW7Gun6xTN8IE9bafugRgUlxEyPQ/Y=
X-Received: by 2002:a05:7300:33a4:b0:2b0:4e90:7755 with SMTP id
 5a478bee46e88-2b17d336a74mr28976eec.8.1767729690670; Tue, 06 Jan 2026
 12:01:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217150010.665153-1-siddhesh@gotplt.org> <20251217224050.1186896-1-siddhesh@gotplt.org>
In-Reply-To: <20251217224050.1186896-1-siddhesh@gotplt.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jan 2026 21:01:17 +0100
X-Gm-Features: AQt7F2rm2cIt5lvkOzP2EUWMGIAmjTpl6PyZUhg_r_Bxlk8y9aFK7bw2z4d2xAg
Message-ID: <CANiq72kGFOHOUjjAmjO7Wn2phcqKiwFG2UdXDu+uwoxJAggTGA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Add -fdiagnostics-show-context to bindgen_skip_c_flags
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 11:41=E2=80=AFPM Siddhesh Poyarekar <siddhesh@gotpl=
t.org> wrote:
>
> This got added with:
>
>   7454048db27d6 ("kbuild: Enable GCC diagnostic context for value-trackin=
g warnings")
>
> but clang does not have this option, so avoid passing it to bindgen.
>
> Cc: stable@vger.kernel.org
> Fixes: 7454048db27d6 ("kbuild: Enable GCC diagnostic context for value-tr=
acking warnings")
> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>

Applied to `rust-fixes` -- thanks everyone!

    [ Details about what the option does are in the commit above. Nathan
      also expands on this:

        Right, this does look correct, as this option is specific to GCC
        for the purpose of exposing more information from GCC internals to
        the user for understanding diagnostics better.

      I checked that in Compiler Explorer GCC 15.2 doesn't have it, but GCC
      trunk indeed has. - Miguel ]

    [ Removed Cc: stable. Added title prefix. - Miguel ]

Cheers,
Miguel
