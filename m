Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32E328B4B
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731842; cv=pass; b=c1+uL9qIjW2kYSxIrdqthoHuHP+3a9VOtWRNwgArprvx+P95+SoV/GPubQhW92ogk06fg3ahSoov3qB/O4jzzgc/SoOBK8LYu+5in48CfAdbqDg4B+ZM/6Rr2XgYoucSX4T0h9p/Y8e9C0yd7wpE6hsEDQeqbLnyj1GiE1QxqNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731842; c=relaxed/simple;
	bh=WkXG0lcU3ynY9rEQ1ZGrA6fh2HIq1CMtWbJHe7auUJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VFOE9DQkSAmFOYBGTaBQt2Klt4LrS8cwprGbMq+DqHZVG5QdWZttGRKwPRbpm5TYExSmUq9vS8hyXvDSkWc5zEjUlghDM2srKOE0FhWnoyi6X/SHEjrOUd7sMk85OYtR5q4py7+uD5l8sNdj2gN+CgNpxzZn8csdE/iNtE5UWvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYS0MIWi; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYS0MIWi"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f13ae64db1so692016eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 10:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779731841; cv=none;
        d=google.com; s=arc-20240605;
        b=azm4hCvi9+CRTIC5VaiBSH6umpFHvajzVIZPX9FTPG5VZnbKukm69Ww21Iu/fFiw5e
         7fB28mQRwQnSoc5cyOB8YEifuwsFaJKtiaN3pxyCB6ydjrGVsYaxaiKsXidBd15xPG2g
         SlWakNPDHX2sqIA13+2rs4qNBrVBbvkcbnjnRgWUTJb99DlbugmjjKqr2HDciyHFSPk8
         /axuH336D5v+sLPJ7xTS3GlCagDxRaULKm3ANVuO3SlcbVI5yObbIRjEW8ZLW1jAGmI0
         7tMzvIrGZlbqpP9NdHIZgNpsQ9T3tujJzXsCjlAPmrt+y3/XgXc4VY1WOl2MeOsYUqdD
         0OHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WkXG0lcU3ynY9rEQ1ZGrA6fh2HIq1CMtWbJHe7auUJM=;
        fh=ZWAblq8YKpRhvFdl0/gl5u7HbaMrwEeFVuZlidEnzpY=;
        b=Jn9QkY/3BrfvFdaPHJ0Gd079Z+7wf/ULV2rnFycuPwSSapLUgoZSyCIC6CKWmpgvQr
         jQqElZggLZ04qN7c1HrAXshuV4KzoTBIWeKjYAs9MYsT10DN94GmxOy5cojwPOHp0oXV
         tExpGn7okkBfZC5A+WVm5J9RkdQVgLbSBQQg6Fw539bRDA5wSJQAGx03UURqg4jA6e9+
         9iaTIyEX30vcFG3OXz2c/0HYC3e8Eegs4NHHJNJ6SV/0qyhTpjVejq9WclmIo4F1zh1/
         27CNsxDxCTPIisdFg9rYef3Elf9b/VgKjBy7GtbtLOwOQ1Uw6Z5sPCmlGHQfNPujSlGJ
         xQqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779731841; x=1780336641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkXG0lcU3ynY9rEQ1ZGrA6fh2HIq1CMtWbJHe7auUJM=;
        b=sYS0MIWi/Eb6LORH3TmfUmm52VkUG1wo81rj+pSXnBlZrKAr+26EkzmjhqOF9h3m+O
         s/7JbYilbcofakN3a3NZ17kOiZkvtFxZXd/WMYAcWGyoMfrdf5F2uORuer0fRe9cPjzA
         2yQ68e+sVMVHZoKjaD9p4IxM6lddOI7NIq0s9YtLAbgzHtHfLcMjZT+Ecqm3KtOn7vKR
         KGtoWjn0f964XiPjiQ3Z5W5EC33Dn5X/wyaaO1prnsgxh5lmR9zJnoAAf+01BKNLyHlA
         AtTxLtA5P+cMK3YoR3fr5TItYZOxaYTFhkoxv6WfP6yNyLOtgU3yZOU7XUX5IgHrg46v
         X0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779731841; x=1780336641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WkXG0lcU3ynY9rEQ1ZGrA6fh2HIq1CMtWbJHe7auUJM=;
        b=ozdRPG1zQem0LUJzA6Q0uwqRxaMvRkLSDIcCHm66zzNsa+JJmqU9wUMziMyXHFz/GA
         UsCtqTI22i4E7tCxTH5KJ4fYSt37pNGayos1KLGy5T0FDPfF5eOR+DsVLVUDCKEutFXl
         /wIsD9vfPRcYF4RxcPtO8GsO6S7qv0XaYHlz2aHrCWEUbVL7NrP3efx0CulBDjPkCcQD
         ZC5OdJt9SAhbbhz44stIqOZA6Y+rcMX/xb8F6UmqpXOR1tFf6IkfnuEA1QxdtCgkcfRJ
         ipgsW2J6hCwIYpwFVO3GCPBWOCBPu4FPJynkUw84o/ePah9Jg/Ck29R8Vuy5Yt4Wuin1
         Mlsg==
X-Forwarded-Encrypted: i=1; AFNElJ8Pz95oSivsga9+pATAkrDO5Gt5Sfzh2Uyo+B2nRyu7xX4hP4KrGldGw6GQiSbcPD8pxmq1c3RkRt4eHLy9+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+p+/+NOa5a3yCNx0uLOLjCP4oCIqxy/fuqr4CQUq3c0/NXkp6
	chbGUpl+wsDkugfk9goDrPzygURy8Y6ekafwaBKqlIsnhU++vKvAVTqJOseYeaHonvkgUA86Uku
	tPWgZKdGPw2uYqhFYpwsp6k8vtS/hG9Y=
X-Gm-Gg: Acq92OErKxZdTmc5behKX9AyRDwvPY+C6ZTLCTQk1VNmHQqyHXIu87QSHPxBr4h1zg8
	32qYiAYr+1CmePdg5NFT4f7QTRtmfUkYLPODye1Z1dkOmtAKDJqI9xa7QPfvDLBMaEsixUzwxwo
	9Gv9R/ikOyn2G7tfIAPoLZRtBcbj8QdEyDSJWDBuNBz/b0ZTPiLBQx5rukGcTmT96xEquQiK1/G
	WxiEU633C493oJUD76GRgEBoWiQrPO6ASFAOxG9yy1W/KQpwpe+VQZMVokxDiiLmpF/OPB/5+46
	8fWUy5p7dytY6eJsb2ZNfeDFhsLwHO9OrDzF5Vw9rn6dAKW9W0dRN5qj2YZFn4yLYkLqYuBKLa7
	To3OOZMd9YNHUNlqtfYP7Vsc=
X-Received: by 2002:a05:693c:2b04:b0:304:9b4b:3b9 with SMTP id
 5a478bee46e88-3049b4b084amr391018eec.6.1779731840826; Mon, 25 May 2026
 10:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-workqueue-v5-sent-v7-0-fb4b4dde35ec@multicorewareinc.com>
 <CANiq72nhvmRuqY6MbFhFa+50ayOEpTQqGozjVOi1GeX401tcSA@mail.gmail.com>
In-Reply-To: <CANiq72nhvmRuqY6MbFhFa+50ayOEpTQqGozjVOi1GeX401tcSA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 19:57:08 +0200
X-Gm-Features: AVHnY4I2lBmW-qIdSgUXuGXD7VoVMQqIs-ruZUTystAjvAUk7ekQNQIaYhSX0Fs
Message-ID: <CANiq72m4YhJhH0u5T+fB=VJAXcffDVq4ZWu0MSXNCsROTkj8jw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] rust-helpers: add workqueue helpers
To: aakash.bollineni@multicorewareinc.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 7:54=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I think something went wrong here: the title seems to be placed here
> after the v7 changelog.
>
> The actual title also somehow has a dash in the prefix
> ("rust-helpers:") which is quite strange too.

Ah, and most importantly, somehow WORKQUEUE is not Cc'd.

Cheers,
Miguel
