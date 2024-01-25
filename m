Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D86E1CA85
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706173729; cv=none; b=aLo5FVodqrixynQsWumehqoFXg44V8w5B8yP7qol4171D+KDjjmYxDjZfzerfLIyBqo8GNkt0uEG2cVZO7RJ4IDtUF1so5rBs5rvjncuqfsCnaTvZAA2SZ6J8rUHIdYi3l11smM9OwsmJ4q1aNIb0/tjkW6YhSHwR49vr9nsU/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706173729; c=relaxed/simple;
	bh=DaaeOBTj4cHWJG3k51yGq2TD3ACFmgQSxId2jEXJNmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2J+H4T+Sz54PXp+tRP+sjcVC9YDV5PUc72ggoehIaXH5cEzSH7AQ4dpic81pX1sR+3OnYrC9qXG54L8/JcCXxUksu1Wx5PJGpNhiqoF86l1pXkIcGLvFmxP90c1Q4ArlGv3kmzXYC68eR3lqztPhso+1wtXX4RmWyEoCo3rPQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VYEZMrn/; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VYEZMrn/"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d2e1a0337bso1964954241.3
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 01:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706173727; x=1706778527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tM1J8tB5KHoGKyoGMxs1iTWky7jMmTAuWrPlK6yjZI=;
        b=VYEZMrn/w1Y+q+tII5Ztg+rUP6CgPvjD4KSAXL+fjScAa9oF1WPVmFBqncscFjW53o
         68jPvmgdShEzV0g5M2BVRPyiBi3aITrNB/0UBOt7limLRThrk+mduI1NaGAREYIN86QO
         YZQXjpwh/36pgvDH7GhQbf3rJV24sOPptHhXMXMUgnhQMFFsv8hpMFBBgtRXS8T/noDW
         1GwTJUP6loW3Er52eB4kJpYd76oIuhzSMv7ta2tLFOYZXHSUB4cNKOKVAa//veXEKfUo
         cc2KFzql0/dpdtatp9OaZtOdRi+T5P8AijeW3WVPkPwVwQ9b1Bo/lkdfDywR7tibK43z
         0fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706173727; x=1706778527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tM1J8tB5KHoGKyoGMxs1iTWky7jMmTAuWrPlK6yjZI=;
        b=Kidc5+Ckngf3QFMElVup6eaf4c5sl7DI4WNc21pJVbh9IBYRKMDSk8HSa7f72kqFXv
         Cs5Qhsvae8vDspHnSAGGETIEBLJrPj2sK8lnrBqA55lhqAy9YTKHJzrRQKQXvJiu7mRx
         i8plrDj3JRDFrOhYWKxdGYTCVya92PhP5eP8EKhsEFexuquCRRr+mi88GjwdHrDz89yZ
         QtkIB+O5YMo2ik1fu9tAzzgwjl8Yz3CBHkKjKw0hEyaoBpU0/0ZBnOk3xsz9HWkkKrvZ
         2LZ5dResTwAtuY98MFEpYt71EOa0PtwsRydc6Zi/7REV7Sc9eTLZ/HD+8KY709AditNp
         FPzA==
X-Gm-Message-State: AOJu0YyVJ9S71/4JfLmUaEltgB6c2WDPhp1M7xtfFBQd/OPX3CqEyv+q
	7VEeXQ1Tbl494VKnkmNmnVgg2fW4ueK7BblRZ/Oql5jl4g52Wp8GpNg40F7uvbFRYSrWX1a0M0l
	A8HRjwcegkh37KshcJ2JGCmv7QDa4XRE5YqImLrkJMKoH0iK/KGKy
X-Google-Smtp-Source: AGHT+IGoivSgrVAUX+nyt4dYy58T+ARTSwUUH4QXRl+s5E1AKpYQyYWAi8S3TfHsuXa8DFxFUmruioIfLZcGmtI4GWg=
X-Received: by 2002:a05:6122:380f:b0:4b7:8e5f:7782 with SMTP id
 em15-20020a056122380f00b004b78e5f7782mr413172vkb.8.1706173727304; Thu, 25 Jan
 2024 01:08:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122184608.11863-1-dakr@redhat.com>
In-Reply-To: <20240122184608.11863-1-dakr@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 25 Jan 2024 10:08:35 +0100
Message-ID: <CAH5fLgiwRDcyaxbcUNY8M1c_w11vkCWyRfqVVrN9Sgc7XYT0xw@mail.gmail.com>
Subject: Re: [PATCH] rust: str: add to_ascii_{upper,lower}case() to CString
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 7:46=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
> +    /// Converts the whole CString to lowercase.
> +    pub fn to_ascii_lowercase(&mut self) {
> +        self.buf.make_ascii_lowercase();
> +    }
> +
> +    /// Converts the whole CString to uppercase.
> +    pub fn to_ascii_uppercase(&mut self) {
> +        self.buf.make_ascii_uppercase();
> +    }
>  }

It looks like these methods are defined on `CString`. However, there's
no requirement that you need *ownership* of the c string to change its
contents - you just need mutable access.

I think it would make more sense to introduce an `impl DerefMut for
CString` that returns a `&mut CStr`, and then define these methods on
`CStr` as `&mut self`. That way, you can still call them on `CString`,
but you can also call it on other mutable c strings.

Alice
