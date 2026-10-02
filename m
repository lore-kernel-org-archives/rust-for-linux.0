Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64DC2DF156
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924797; cv=pass; b=OygwAZwz5EvthD2x/N6q9yef7gJBv82hiqK25gb+BGSuIKoqnH3xCWYD0JbCUXP9jX4NAZ8mJ4Ap2+hFriH45/fTraaRcnEZTsZlhkFHlubJ9j+sTFjW0QPuQOQK2u7xMA/MUYSCvrTUNRHPiFcw7EiHotQQ43H1eL7rcUj/Cv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924797; c=relaxed/simple;
	bh=p5mHTSid7ZHG73d5vk/neGkwUD4BDQU+cFE79JqE43I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STbnwcXHgnrxLjhUK7N/nb+COLVKJPEzVRQiXnhNayhQ0hvJT3hgubSBmOE9JHOOvwdy1Qjqmzn2MPapKnl8qHHiXOn2LvyNbqt7cVWI8QwjW2qEhdGoiwfwi19LPubpFgk+BTxaLgY1ihSyFMMxkYfVyi1PSiEm86IXmMHoVTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfCbAi8G; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfCbAi8G"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c28125492so297065eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 00:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790924795; cv=none;
        d=google.com; s=arc-20260327;
        b=qEMot9r6LBntePApLE5sOShIIcxz0deopvrvbW5NOb9I9Xdf/G1UnOonBnFlCXaUz+
         6e1acB4R9jcmf89nVFeSn8JPphnIBX4OpMXk0zyWAAvSOe+MsfgmMIpJXalsuQu46PIS
         iHLEOCfjNGFsbDJZnm3WpPdX0KZjdgn9uqLkUxWxZzjZ1xh67/jstxWXYOuBo6imwF7Q
         KoDLueMQWAeGxLq12+0QnwyfaE6y2p+qEz8dZDvfZrGloMBzsRpf7+l+FbWOmc4ZzWb6
         gMTI5oxQapkKbJVHw/m5H2GR3ihfk8ll/Y8pjHe3WA7qEo6LPrmia4jFmAvk+Linegxg
         fWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p5mHTSid7ZHG73d5vk/neGkwUD4BDQU+cFE79JqE43I=;
        fh=+iql9cK3DvNCxcOBtadR4pR+nqaYSdr+v3ttM8Utm/o=;
        b=N5tyihsIUpxGqiDYrF6sc93JreZnqWa8L5xGhoQlXqlU14lJa9mLV6iAnAPDHF6YV3
         eGZGRiwfHIxhLUDqyQXjN0jQs+EZ/nzd3aWvKEdI9ZSubiyF6ozgWIepPD3KdhdL22pT
         9McdjBlDXQqmntH1fuixA+UTu/QxZkp7gsjRvw8C8LKCEIn5wPb9MnHWZFwdtuJ/qldM
         dl+C/pVKcpnSrk/86kZGc6/YYWutomFqWmTWk91Za6BS2Hr+nPbKeVy1BsT+OPQ4JnSy
         I6IsVciq8YdVReqG8vRNTz8MX+vdeTgJnCJ1KTIhhU0oHdpPlvkab2dSgusS8K01mtyN
         4Jow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790924795; x=1791529595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5mHTSid7ZHG73d5vk/neGkwUD4BDQU+cFE79JqE43I=;
        b=DfCbAi8G4hznGrFWoblcSqWRCssxNIT46MMEbrJ5S3UutsGsLkvze3DaVQ/O8j2fi+
         0B/NSFJykr+lMUIsHAh3x0EKXpMSQykxwm5LtWnVZP23YXhJYeyEwXbcC97oXQKMmI71
         8YRJde+nZu8M/u8Qb2ikM0Q1YeLmu0QV253CjcAG8AcbIX69TAn8bVZ7YxjiJzNB4rNp
         TFyX9VSmuV+zcbdul1Q12k9UNyypiyqY7VsQe14RP4ISvnAy0f0iZ0gc86FWVekS3ZVS
         k+9YM+3F8thpHkd3TzGv6izWCD0S1mKsbA3YN0x6BiCC7CkB4Am/CCwX5A4lbQZ3qS+c
         MqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924795; x=1791529595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5mHTSid7ZHG73d5vk/neGkwUD4BDQU+cFE79JqE43I=;
        b=2cNWEwUT4zAURhuSG1h1a76MsvkklFNYEaKEcPaB5NuqJo04hJXeYglijGDFuD9jak
         7J5N3WrEAtFsB62sefiM+rC7LLDszzwU2GPipoDPNFl60a9b/9Feo0sMAlLZjaHPNFFI
         IeveXzqmPbhygw6W4cAi5SxhmBUeP6ebs1yKPQTNk6JKTgBK1cTJ3o8tGl3FrFQFa+zl
         uQOu8MYeUNQAWjvHSkiNgKoLxDPq2/tnqqZNgQPy3d9lAY8A4tuAlvg3H+mxfYBeTZgU
         TYOVaBj0g2chNfAFSLxD7/GIFjAa841WBXiFVac2xaabEtBqyDKdN3OSOGbTbiB2A0ri
         IHug==
X-Forwarded-Encrypted: i=1; AKwUvBwthrCGTwazsuQvt6W8M4P6RimdTNwMb7pO8tp+yVW8l9pGwaLSa+4QFgjVpGSEh970L83h1ZHSjLpwe998HA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLs2k2KzkfoTeZ1gTi/WQYGH8OGzeS17UlDHVPTbuihcb7YtIwd
	VxTib7VCkFVfRXYqOfa1nCUpJ5X7Ao47cw0FvxU0XpNBv8Hyo+r2U91fNx/JEJr/P3saeB14vPe
	h+eFJeoZVMPJe8yfrryCidAe6eQrWUWA=
X-Gm-Gg: AYBFou0W2XkhcpPhDL6Nc6c4epNEvl9HHDcYXHcdFTfBHmVgm3SzdEDakOyuQGreqrr
	tEckoZLexGHYjsoxMAZ+HkOLLxDBBE/1r/wG02UXcKTUqTcMkC64TEVOfRhdgQs9WsjPeF8C2Sc
	kG0sVQ19gxrX3fTpT52g572lFsaSIHeShYLduNy+9G4T9Za2/MGq8NiKBT95l83y+G/8AT2TrrX
	sOp1fWkYQ1jOJUrwQPaGpTLKTw3VCMt7bR7QfYee0bOiBP11IWO6jyfnRVDal05F7ZZi08rc/CV
	Ly0WfWN7GSEaE/SPyIquJdNK61NKdRotjknJ7yFTLbrGpLnXc6eGQ899vpmhzgCmPyBvo356zff
	8oqOQuFipkuvLFAgkTsaDPDhVeJ+2gtUuuB9upOfvu8DyKU8ORQAyEigEe0swQvWZ+0ThzSPAnj
	wFUzRhVCCNgDdKLSuiNeIBbFWg1OcwSUAPPOVb+hB+FmC3EfbeZHUts6uIlX9flA==
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr3462444eec.1.1790924794805; Fri, 02 Oct 2026
 00:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917051147.98775-1-tweek@google.com>
In-Reply-To: <20260917051147.98775-1-tweek@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 09:06:21 +0200
X-Gm-Features: AclHuK8lJ9lWMbMYvuPCA4PNhehiCTluRjGb1PR9k0qMsRR1b7vJrjMUZYoSk6M
Message-ID: <CANiq72=SX8xxCAzf6tcQb1CUoa_f8Y9fxVSqEBsSwqUtfsxn6g@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:11=E2=80=AFAM Thi=C3=A9baud Weksteen <tweek@googl=
e.com> wrote:
>
> Module authors may have non-ASCII characters in their names. In C,
> `MODULE_AUTHOR` allows arbitrary string literals which are emitted as
> raw UTF-8 bytes into the `.modinfo` section, and multiple in-tree
> modules use non-ASCII author names.
>
> Originally, the single `author` field permitted arbitrary string literals
> including non-ASCII characters. When support for multiple authors was
> introduced in commit 38559da6afb2 ("rust: module: introduce `authors`
> key"), it reused the `expect_string_array` helper that had originally bee=
n
> added for module aliases. Because that helper enforced an ASCII check,
> `authors` inadvertently became restricted to ASCII-only string literals.
> Later, when the macro parsing was rewritten to use `syn` in commit
> c578ad703ae9 ("rust: macros: use `syn` to parse `module!` macro"), this
> restriction was carried over by using AsciiLitStr in `authors` type.
>
> Change the element type of `authors` in `ModuleInfo` from `AsciiLitStr`
> to `LitStr` so that UTF-8 author names are permitted.
>
> Fixes: 38559da6afb2 ("rust: module: introduce `authors` key")
> Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>

Applied to `rust-next` -- thanks!

Cheers,
Miguel
