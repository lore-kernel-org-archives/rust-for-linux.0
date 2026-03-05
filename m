Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B5036922D
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Mar 2026 23:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772754964; cv=pass; b=mxdVDYjOt4fa9CXem1MfmtvcZ0aMxqRp9onAE8x0B215hNCZJ0lgwxRG2CNzR9g/J9o2QWvXQYYpbkCApY6TosLXgxSW2KNhQeUttmvGALwWuf2ZWida89l7MybAJm+6sBNijvJxtQ3iY+S9SLU9+jKo3tSbHULSAz6+tdFDv+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772754964; c=relaxed/simple;
	bh=Bt3605Fsr3U1TBJSaoVz0zQG7fmg1eER/wIuM+DoS2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNVvTpnF+2lUOl170f8tdKLhrWVVOT8Y+6VRR61WOHN8+WWm8WbsMDTVl95rSkNGjuQI0Ii3v//tym6DbDFqMS23zaAW8mIiyGK2QHGuSHy1an7DFpkP6ebOMEMBuulwxFPL5rqZ7xk+0LOVSEc4xfucLmvBwh0iTU7Lkrmaeag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKrqnNph; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKrqnNph"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b8095668ebso535637eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Mar 2026 15:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772754963; cv=none;
        d=google.com; s=arc-20240605;
        b=EF5mBrCzhVn6YJmJRIRmiw0ceBBivomVD2Y50No1nJkxfLYrrL2IbXjCbZFqAczV9u
         +P7Du3HV14qIf4IVZEZi4a+SRMHkSgq9bnNg3QEVlhe6zmANBfuGhBvfY4YlVOm01R4S
         95kIkPPmAkJ4ZhBM+2lNABzsaciy02xUJIuYhJfFKfBfmY9ZwJT9zk2krGz2oVO/SvoJ
         tORoMuaZPWvaOg+qn81cBQgVY/E5ML96fa2tZJJp+LratzLkhHWyoqnjgPKwYHxtuJsY
         /POLVZXgbld4jmU2apnBjYmU/6bG29hE2SON/ikKdOQJLbznQ/LzP15iyQTb023bJCYv
         Gpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bt3605Fsr3U1TBJSaoVz0zQG7fmg1eER/wIuM+DoS2w=;
        fh=EzGpd9etK0p/8H3c8MdPMUxaTkeXTJQpis/WT6pVHp0=;
        b=csbWD3kzCVTxWyeFB4xvrVRwQZDwC8d3xMhCf2m3FKG3gcN6qM1HOy5EfoOdOLBG/6
         ykasdO6UtSpTEMM/YA1ndnM0PgbuLP34Au+XlbsPYaKqhY7abz0seEMfXCG1Pk0Wv2/1
         jGc28dnjC+PyP3dXqkzTcuIdhOZduaAsFlB6/A9Ub8EMWwlpdJOvWfUxB8LCpTf2OW9F
         +Wv45lXOksbySprzeaddfMB+LTxFYNofvct8KyGc8oSSrMwB4Y6Vn9bLVyybxG575Vc4
         +Sybqu/K7ok4Qe9OebmWNgNAuEgulUgGc0ek7TR0lbs6AwrEVvek1fUQVTtDqn9Ee+Rs
         o6tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772754963; x=1773359763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt3605Fsr3U1TBJSaoVz0zQG7fmg1eER/wIuM+DoS2w=;
        b=aKrqnNphyLfK77yScaE75JMfPCpW1gpFpZwfvBc/KwO6COB2CpDQZC3DGoZPVwwiO5
         xejPke2tRAX50x/jkpaVNK3gBM8igtTfyqxkzwFvTGeZekFhsqv2vPgf5YqJOn4MADen
         O129LnmVzyUEBEFlJjOp/6Z+8nuXAHhFi85Up7K8y4E+lfyL86V9Qv/zCE+1G5e+fdG8
         1804qWgz0HUMztxqcQbXlEytPa4Df+dB1DrFg+u8ctXWhVjyh4O1I5bhZWG3Q+T3cCCD
         vmhsDiQc+eMDJvaN2QKMGIV2PTs6EIDaUsNjqx9VhoOlGv6eZMzVnZQZGaCQN5j4KII3
         vkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772754963; x=1773359763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bt3605Fsr3U1TBJSaoVz0zQG7fmg1eER/wIuM+DoS2w=;
        b=GWxqLbFQhbuVTHEKOF4ONmAOaaz3Fxx+M2a9VnUE+YMhI8Fx3sIMnrFOR3RBT6zNKz
         wfpfzLtff1d30jdlMmJpkrw33wH/wHe1W7n+Gv8akYtSJ8DtZ8Cdp+x43dlN5H+O4aEO
         2JNs0x2doFj3gfveQI8ExCX11QfB6Bhfk9uEDR24w/aIevQJ4EDFEMcv3TwEdNAYJa1a
         OXtSPOu83xO4GDFQz1GFf0fqGhn/MEqKCaymFlvTzfZjCKqwSU7uptSThmieuwDF9vW5
         hS46Vqp5qegUjO+pIDbeJNS6qmBNZaRwTHzNbCGRa1BA+6enUaqvkxgyUyUB69vwyf44
         ujNw==
X-Forwarded-Encrypted: i=1; AJvYcCXqC4w6mvVyD1VI58exTWszthH/yyhN2rr8cih6Kw/6u31Qjh6N5RFseCEwAz80n6Fzb2qiWt+jTQLKGHoR/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFT4GutVY66ZuLf6Q5xcfd+K/7LCdr3klyav/X6RVIWwq3IX1C
	LB1oPgwk2ZkoNMQ2Q5iO68g0642fui36MAS6thoKFTYDcFgktQ2Y3peUTTiTrLpXv+S3u12uNlZ
	+MteAOsO1NgD93QKnc0ETJ+LLr5WrBqQ=
X-Gm-Gg: ATEYQzxKcnUCymFLemvxVYA2QBGm7l6zu1FzmLOhHfJZG5nzciy3CjieRHX4iQJ7ni+
	mS0V+qQHwHlrKzhGAXU5VoikPGrzMblf5QgRVeUjuQpzYXGKXOvTnwJlja+YuIAOgVjB2L7JsU+
	BNCTqiIjJfdU/qlE2Stwc8GjJ0CGxw8+6g0Gsi7UAwEFyoWBnu0Pk7aHh3Q8fb4r7nB3u8k3aLf
	ZJT8F307Z01A14vj4GoNT5wMnCvgoFPSJ/WlCBLIp8v/fpXfQDF9mKXRNgw38tIGf034eUahy4k
	xvXEaERt+DQQkPgpUWQ/VOQe/bst2poMPqbNAuia6GVuIAIyhXUmSZ3JWaSoeEXyvlIHE3ajiqA
	I6WLW+rJewz6Rd5rflneGFY7I
X-Received: by 2002:a05:7300:af06:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2be4e0f0d27mr43522eec.5.1772754962577; Thu, 05 Mar 2026
 15:56:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
 <CANiq72kROq3B=EPfihKM=bvtyqYrbDV-mkFgROdPNjbC6zaBpQ@mail.gmail.com>
 <cccf55e9-e744-4581-9c14-ffa54bc90faf@davidgow.net> <CANiq72kXjytTqpYGbNqKKPBZoGFYHT-3JMb08we9kEOqiK4dmQ@mail.gmail.com>
In-Reply-To: <CANiq72kXjytTqpYGbNqKKPBZoGFYHT-3JMb08we9kEOqiK4dmQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 00:55:50 +0100
X-Gm-Features: AaiRm50VzeXAI15UUkXj2oOE9tivNBlF4lsRD74lRvFS5bND2OsLHuMulTuiXys
Message-ID: <CANiq72ng68YhZuEWYwZTovXn=y7Ng10QEp7rb9YED9f1SUu2wA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: David Gow <david@davidgow.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 1:07=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ah, good, thanks!
>
> I saw your Reviewed-by and no notification of being queued so I
> thought you expected me to pick it up.
>
> Happy to remove it, but it would be nice to get the Cc: stable@ there
> to avoid having to send it later.

Ok, I will remove it since I am not hearing anything, but I will send
a message to stable now to avoid forgetting about it later.

Cc'ing Shuah, by the way.

Thanks!

Cheers,
Miguel
