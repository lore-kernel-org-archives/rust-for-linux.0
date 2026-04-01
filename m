Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA6A3A6EF7
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037829; cv=pass; b=Yxi8JTVxEEukZQiwdF7m/Cb6ujxNv06UpWPFphWzJBLvzfp52rcxrfPZkhyTrpt4xA5W8dD8C4v9+sLK5N/8Vr6hWEY3hFhFo2oHIYIiHW9UnAlLa5geI1hmdVLNa5Ex0SR0oqoY0yFmRZIWE6FNcD2s/Dg2yS3ADqRBXTe+hNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037829; c=relaxed/simple;
	bh=AJ2quvZJjxJ968c99q3z1Ux/NssK0pydCtaBwBE1/jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izo+EgbMo6N8bQ70vZewHRfNaRnV+R5XAWyD0LYjfsnyna7IjqyxnkM0JKUiagsNjUf3Kkdmu+Pa4vnd/QrE/XFomE7boS4mHmlMSZ69cgarJVptmwD2ECK6aCxEcQN+CtbEfLol0GCaLcKesDgYYeBqN08Jtr/1NoLXgiOhV84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCzuTSNV; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCzuTSNV"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b8095668ebso167386eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 03:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775037827; cv=none;
        d=google.com; s=arc-20240605;
        b=U27BHTIodCHMzoaHXsayvsrAv9n7dAWO5FnV2tUX6qD2wok3GA9EKHG52Nii9C70mQ
         UC3zeN9OjWfS8cZrGohNOWf1men0Tdgv86HJRCvqD7vxmZSwmBRckRxcot2Mk3yTIBaL
         FWktMxa7ueseWrBL3ctDYSHIO/eLjH8cJ+BXkf9l8sTjZTIJ0DEKzlmcKnekv5M4ybyB
         oVaQdrzgYh/gnInatmnn1HsZqG9QKMPrmrs3dpJvcwnnzYbSb0MHBVjb0jbEKjLqSBPX
         oipgsBAlxHW6LAgN0Np8p3BJfLCI0lJkfXuR6AWmzqmTSWftA9z8AEMtHbh33vEDWaIs
         dT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B/8ubLvc4l6vm02Zln8wHr4MKpoVNC28rHKFpnZgCgw=;
        fh=MtGQh0KUeX+wIT2S7r2cXVa4Pdp8LA0X7AnpI98OGps=;
        b=MwMVKZgvHNUWNPCVT66ySCdQ3ny10U1ePd/oRhf0etFT/mgvXuH3vqlOtp+4j14PJG
         PdACehHKhA2UBSNhpQRkxDdKrbnPDSzNioo9jf6yFSZIEPRrsAEcm+ZzFiiQe80KBv0o
         gguBGtHxK1GyOQ8T/P+4Q9YksUZYMkn9tWAS1UGzGOzBOrubyeMaAECuepVzSmgRm7Aa
         C9p/gEkzC+W69OLkVwRITaWZ9Rm3lgT7Peud7wolrurX5Hrygxjzp5CSp9BfWGGOGmXR
         z6OjmAMC8o8MaZ5vGTBCftrdbqgSbLqwyIdFHMblOX4eaBjLp6dA3bNoOOEc4NnjbSVN
         9H8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775037827; x=1775642627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/8ubLvc4l6vm02Zln8wHr4MKpoVNC28rHKFpnZgCgw=;
        b=gCzuTSNVij/Fcac9ZobRENUx7OwMy0lWg+oqKsCWNogFngtxT17WKQgngvhVN8UCQ1
         s5fbXV43+XkjxOFgaSZE6XYvQQezpca0UvxxkCbP+j/tGU8kxou0jHVCHqHy6oE0gnhB
         9UJ96wxRZ8qF8oX4yohrUA7XS3+NIRYQTa6VG+gulnkBVG3Xww2xguW8HTKHCFlfeiB+
         FQNCrpJa62AwVvAZTvwwgVxI5fjL+WufUcJtiuelp4iY1cwhP7azIj0rbKwxBH/7wS2+
         z9S7OyZcHsmTsHnZde+b9ej13kTI8C65ROuawKHzjn+ROVTKDbOBsTrLVX2cJajzZkxo
         4pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037827; x=1775642627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B/8ubLvc4l6vm02Zln8wHr4MKpoVNC28rHKFpnZgCgw=;
        b=mJa9YzRjwGvdlTXfdc5HxK6eYVHOOcZwHFG+2uLojivvN1kh7ioCY813gBCwFvkOg9
         +wd8vdhtS0uL+e3THyIawwZW3TgnDEMcwApAcZcJ2sAytm5IuiOZ1x6RYyEYv1P2Mzc1
         W5gMQSdvk66kwwSerFNX0zhSJtE/yh3xiw8wPYBvmxQ32Qpj1uoiD7qlF9ImiP1hU11v
         4Wzy8ZDDy+40nnaeXniqgshSa4u8FkpHeThjgyazAl3rQFDy3SX8WRUBDp4d3gSY3qAW
         WSv+vy2/H1H5KkOrkevoPGYWRMFLn6Y2ruNzv/hE7nk08Fk+fjAv3l+R4POnZA4RkOUm
         u2+w==
X-Gm-Message-State: AOJu0YyUpTWtKjfDhGT70MF30deMIHsyU+giDmKIQYH1wsqjYII19RIp
	FiaPO22cyue1V8bW6+J8Cc5Sn0P8c2OvNK9isPxdvnDmWlZh00RFN6UpmvRYMHlKixigNT9lrQA
	7lXnB7x/+07P5Ya8CujifWIzNbWG78sNBY3IyVyacOQ==
X-Gm-Gg: ATEYQzyjGdzwnDp6Sjd7uFPtJ4AKfRCBJRrnDGP4yXP9Qltccio/xDsSIlTBEvl0bT9
	FeHG0zIDNsIjAStFLBRhdgE3i21wt+73pyhcKU9bO/MD98f6DJc41mNDOllcMyWK3FjRT4OLm7q
	QGNaPa9EAoSclh83BMzicTCXzl7YIQuIa9hL0Tw0Myzbf2Hp5EvqFfkIirx5+4eYNo1py/scYzq
	kv3R4kgSsO77vsAmLFQOxYitaplgnGws/wPgbE8U+AIW3qSvg/enoVgtbCI6OGnK8YTWEBJjQHq
	OvlSpjVXZfPORJRYdro8N16t1vVy/6dTJIu2tNuQf7i08Sqw1RJxdS/6r5DAUjEmTZfldhsLzTM
	WAkaxqov9zxEW943Vayf9SLP1CvxFeksTSA==
X-Received: by 2002:a05:7301:3d12:b0:2c7:2cac:814c with SMTP id
 5a478bee46e88-2c9324b673bmr581316eec.3.1775037826985; Wed, 01 Apr 2026
 03:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PN2P287MB2978F92A42E4EA8B8A0C37DDF550A@PN2P287MB2978.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN2P287MB2978F92A42E4EA8B8A0C37DDF550A@PN2P287MB2978.INDP287.PROD.OUTLOOK.COM>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 12:03:34 +0200
X-Gm-Features: AQROBzAHc0WwyO61-p-ZedsnhwK0Kt2-cJbETiX4dkLJ_SbQ68hZTAY2Iobc_UM
Message-ID: <CANiq72m6VsVWaK56cutQP_hY9exoY-KBLOPbh2y1M_uX=c8hpQ@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: add safe cancellation and status checks
To: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Cc: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"tj@kernel.org" <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aakash,

On Wed, Apr 1, 2026 at 11:37=E2=80=AFAM Aakash Bollineni
<aakash.bollineni@multicorewareinc.com> wrote:
>
> Please  find the patch attached as a plain-text-file.

The message has reached the mailing list, but you will probably want
to submit it as plain text without attachments to get reviewers to
take a look. You can use `git send-email` or `b4` for that -- please
see:

  https://docs.kernel.org/process/submitting-patches.html

If your company's email services do not allow you to easily use `git
send-email`, then you may want to check `b4`'s web submission
endpoint:

  https://b4.docs.kernel.org/en/latest/contributor/send.html

Also, please take the chance to Cc the rest of the
maintainers/reviewers -- please use `scripts/get_maintainer.pl` for
that.

From a quick look, it seems there are also apparently unrelated
changes, e.g. the `.kunitconfig` file at the top-level (which seems
spurious), `// SAFETY` comments and fixes to typos. I would suggest
splitting those into patches (even if they are all in a single patch
series).

I hope that helps!

Cheers,
Miguel
