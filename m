Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F74A45563B
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938504; cv=pass; b=hFe3bIUC7SrZI1pKQ+D25M5y6CvVhbXYhZr7bUpZjFWIdjEIb0TM1Y2r8XxQ3f85r8Da0VwqUU8SzMymhWax9hvCYNnXMVoQ5OTMDN95pJ6U3xuSlSf3IpMA3EnNeNpo7bm47/x0g29h7vBdX4xDOTN0e04faM3dq9rMoC/Pmg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938504; c=relaxed/simple;
	bh=1BcgLlwIDQd7WDm8rTVE7lPjWHBuss1Gdr7b0jYHET0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUfnfNXre6hq2ynSHjwhuyjMLyG+7SVk0lycxz8/l0qAbbcC7B2YGZ/+ttogcTSgEVZoFFa6t4N08Lpgna10xFAv2qHCP8fcTrilW2T6mrp/sgUo7Ho89fHwTfN+PqIcrBV8CthcZJ1cWCBS/P85lToZNFCf4ujuRR+YW8P0pfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmtWD75f; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmtWD75f"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-350e6de7dfeso40487eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 03:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790938502; cv=none;
        d=google.com; s=arc-20260327;
        b=BCBTOc7JSHRlswBD5thwY3Ymgu4nyLCr8zwcm1p5NyidDvbY2+/0G2oIWyYa7zHo++
         JExQipB2vPByEc4BtuyxGqo4eRBSA35KqwDfvwdxbSkDJdK4CYyF281MjlZkCYBO4Bbo
         Wzt6K7uRwZgaYE6cV0EBzyRS8loMU2jV5nk4PyPcyWf8tr5p4Cx6TM4lZ+PFTlqL81ye
         AM7QCJKGNlGLZzY8QG9OG1Oubl7BqXqql0XO8a1ZA9e/qZf67IYpapML5/guR73UlfED
         9XsaP/6xaRu0AE8nBO+KkAVQg8SUp31bpzYfqYsLaQ5xc2wmDG6urOrhZ9P7SwaGM6QZ
         tdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1BcgLlwIDQd7WDm8rTVE7lPjWHBuss1Gdr7b0jYHET0=;
        fh=sit1kXf5s4kOkPHE1lwfpWw3On1LRFTcnzL2Pp0pFRk=;
        b=J1MnfLx6VG02j8h7+9GXSGYRt0iqoBi3vH26dz426iZsFrcIudR24J/N+NxJHF5ZfR
         dvd1hBMHU7tCvtR8koocVpjghbzXhV60UqUcUlUxrn2YYx9C9K34v+S3i6b1eOzuhSOZ
         KYnHZjLCwbExLht7nt/7bjwUgFhBC7VkMrn3O95nNU/ioOCmB1VGR14i9kfHO6Xts4PB
         ipHoqS0nczcODCKL6fIRuKh1b6vkYFHBBeBHZaUGNvar21clRRvDtSbtMfMZ9b0YF8UX
         Z8ZMqAk4Dia4rfSg+YSsziZ/liAL7DjmqbjO27/obI64dgNzz5uc939ttnYFaFbpUx6T
         S9+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790938502; x=1791543302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BcgLlwIDQd7WDm8rTVE7lPjWHBuss1Gdr7b0jYHET0=;
        b=bmtWD75fuGSVhmnI0SBkjEQqMqlI1l6+xno/Md3rr43665rf4QkJtrJ11aReDVk6xk
         mcW8U5oNaAxtqwHLehEoJYtRdaM06b7tHGBgmNOhG4MpHVaIWHo8irQd1kXEvZqB9BiA
         HHVP31Iu58pUWQxjgbQ8S1fXLMmnxs/ZALeG4F/ghXvrAsZqIZ9+aeLuUaRFR6T8kvKn
         LOSqP43kVUxPFe0BNIrOAoT7CjaemmMdMJM4xKJNh2dcMxx+Lax6uUl/W+ro9kVHo7ss
         +Bpj+UjRWYsivqGU7H9R8kwMBzeFYD2utgbWC98Aw9D8KUOZZ/YJ4LB/p0LY6Rv3zwq7
         I8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938502; x=1791543302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BcgLlwIDQd7WDm8rTVE7lPjWHBuss1Gdr7b0jYHET0=;
        b=qUdm8hBaD3BvKbwzasyGZaiUTH5ziwrGOG78jH1EPvZgJ1qAjFeTz2tZ9qOoDAxXQF
         E+0NwtuRfYtbvLBY3xBc1DGQ65K7wljeAmKvbFP1kgYqKuoMiFXhkHcCEi6hnZdZM5Vc
         WJie3f3/JSaT0/hOnIOkf6uDalqoASmic1keu16Qe1kHEqimr0UMVYhhBdXjnU32rfDX
         UdeS/xWTYn74IN+K16o7arjLTFHjwrqe6cluaGEsw13AEcuSXUZcWWsaEebyY+5M06qZ
         ChORz3U57g5k0y3Y6aCVTxslG8WVvqV9HnSq7tW35nvZnqqYdLvL1EWi12HNCbJp0w9U
         4+9A==
X-Forwarded-Encrypted: i=1; AKwUvBzfmWd0JspTT4l0lE58TQfIIha/eatuqc17IJ3VQDf4nozrUPfJ76YHOysMLpkp+UHWYP+Z2mfGk/CjgQq3Eg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/LrD70zuvFapE+4jBNz1zmnyRaEgLlXPVW/2ew+ldZDQbBDfA
	cbkEVclqc7hNEaMbHEGj4jp9m15NVgK6k16yfuJEMKYF13LWz8dg7Xh4jhXn8nP7UGuXc7r11l1
	rY+Ha+OyR+yUAo8bpDvpEV8oxqXguiJ0=
X-Gm-Gg: AYBFou0AuYr8zxa0cnrl4fcKCYeTqIOd6E2DKLZGq6r6adZ2rXYlKXXYufA8t1WQ3NJ
	Zfs+Dp1+ink6PmxwqMU8Uf46ZCqvT3sbLvZwKbR3VvXTWractPlAoZ4BUXDaxjbyz1TpKi4lOGN
	WjNQFWjaFxd+N0m5AOYi12htxTjNQw7Oo6gGJzQBE5RwP2nOXDB8zlhIWc0o7CB6pV18EXTjfoF
	Ng6EZdUUVf7fsKxjoCxrmaAzT3nzgsR216j4V9eiWS4aEkmr1ffUfSLj/xYg2FWYmeCOdnx4QLJ
	aq3iKGVhQMzDeMthxTkdAD6TYWN0u10AN3yf0qOkm1qW9Ax9hidIKiPPp2fkRhMrMKNJRYeT5IW
	7dYEu0PB1a8oOfwnqDzRcbSBWh4Nu1kNTDitWimuS7el4Rd7Rz/CBgzURos0gSRNzeKKTPtsp8H
	J+WgrS6UWubgeteWTloEaEhVJTu2nrcNOXJojEEICd7K6+b7oBs1c=
X-Received: by 2002:a05:693c:8951:20b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34f1503d60cmr4177305eec.2.1790938501968; Fri, 02 Oct 2026
 03:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002104550.2877930-1-tomo@flapping.org>
In-Reply-To: <20261002104550.2877930-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 12:54:47 +0200
X-Gm-Features: AclHuK_EQJEqNSG0UyehlQ3uYP4G6dyInoK_YrzSm866R9UGablAYdj1wxvktZQ
Message-ID: <CANiq72=i189z9iKtz0x8qR2YO_R1WEPLcRGr3q3aOTwXsEQN4A@mail.gmail.com>
Subject: Re: [PATCH v1] rust: bug: update the SAFETY comment for
 warn_slowpath_fmt() on UML
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, anton.ivanov@cambridgegreys.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, linux-um@lists.infradead.org, lossin@kernel.org, 
	richard@nod.at, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:46=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> The SAFETY comment says that it is always safe to call
> `warn_slowpath_fmt()` with a valid null-terminated string. This is not
> true. The taint argument must also be a valid taint number.
> Commit 951d09ca450c ("rust: bug: pass TAINT_WARN to warn_slowpath_fmt()
> on UML") fixed a bug where it was not.
>
> List each condition that the call meets: the file name, the taint
> number, and the null `fmt`.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Thanks Tomo!

(By the way, you have been authoring all the work in this file -- we
could have an entry for the file in `MAINTAINERS` if you want it)

Cheers,
Miguel
