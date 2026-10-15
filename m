Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94415456E1C
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 06:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046500; cv=pass; b=E0GHs70GN4PTkq48KEiD+r31sMJL1ZR3a3wMAbuFBcynB9x0qEE/nGoQLi5FT/X3NyTz0CQEUwHuOjepKk9gKm9Tx1UErXZUduhpKS9NymH9tt2EL/VNA0W6cOnDHejYUOKds/GYVDQ+un38sISZUOp7z5sYgR1s89RSk3V6fPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046500; c=relaxed/simple;
	bh=MrFGI1be76pYyB9TL6I9wBqjO1kJCs3f0U+Fi8vpDZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq20BUr/wRWIGREuTHfNV/b6KmMXcJoxL1k+StOukESj76U1kJi9hfOfRupZWMFmFf3bEpWWudRzegcB7oK2QHZ7UbZrfGuWXpTQkJOyQxRCqkqON4LU7wY6hedzjy+NexeEtkv4gufG5t2Ys0yt1pkt0PtSXhKLo/b/PPyQQbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9mUXX//; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9mUXX//"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535aa147d8so365329eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 23:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792046498; cv=none;
        d=google.com; s=arc-20260327;
        b=kD+VqbpL5eUi1EKG2nGz1KE1cTJoQKunz2iEo7Ejz3zhTNulm4Q8Ol7MIJSWp4vC50
         LL7Z/i2wz3UQMckOUJSmKGWC2BJV7lr9emE0pYrpNU6lTT24Dkg7YnZLMe6XEZ6c+MXU
         XeR8dhMXqxLnl2ET3lOnr2u7HUrLsyinElS3eI9j509xinmYL8iMLxuh+wr7Z0QkMhHY
         lWsTpYdy7kaTVuyg8Ie/8DrL4iaCoRfS8o1tsWSGRqtJ/p0ylrWXm7mf5Pv9MNzEyZNM
         HkXJ9FBFIj+gMDvoeLp90auL0+2JxLchtwJ4aqw2gb7Zro5U033CCyiGgWJu6/hUfbSJ
         rQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9odSnvYCtr0sGptAX/xIcYUrhmINaRR4pN3Qm6Y4SjU=;
        fh=k5IFEJosAOjIWPuGwLAy8KkZx0eFOpjdEZSOwL63D2Y=;
        b=N9rxMADQX6WhMAn6RXJoeFOmIwwIkpht3zxkfjW/nStGpDDqPDe9FmCljt6n75xRjR
         uTVyhpI+nOpU9zP6ZNK2ycMFSfOnwR07SF0WWBxpxarmgRuaRRJQExNIUYyP7kqZl3dK
         rNnsYnWfKebLQcy6mvwwu3Q6AiG2qVELUJEkUGlBC1p5k1N3t+i5P+qXGFGKX2r5sony
         2VP5jOj0VV1umvz7UdtcFq4qo7qU9oGsaHfXB4grjQZptVaXgyuBKoq9kb4AOef/7zXj
         DTGXuztUCTIq7O8qBiGmb+wvxOggTcSA7bMN83D14sB5cs7irnHJDsKUt+M09A2oIykA
         XyQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792046498; x=1792651298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9odSnvYCtr0sGptAX/xIcYUrhmINaRR4pN3Qm6Y4SjU=;
        b=d9mUXX//0M3BTdGknxyw62CeTj5V3Y/5LN9YHt24xbjmuhkd0YFUzgB+euNwwpZXey
         +uSWeXhLWol1IEM6gbxUQ2Q9idIdeXmwgIcSbyBqkakMBNGLzvn5LD4FQkJ1ks8IZgy3
         5lzIkaEDc8BfgLo2yHGw0alXY8BWi9NNcp3Z+9Npb0k6HhOF/uXcLFWNstTExJVndfcC
         0+2oAP+XV7nnlVAfa6wF3UgClnx0o3Sm+EwS0pxPDYRyIt1oypzVnDBtVxWnZGv0glID
         pP93teQk6cc3c7XBr+ipgP94/ooGaUFCcZUGvKUl1wKu9nX612K4vhh/vBH0wzksFgVQ
         r+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046498; x=1792651298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9odSnvYCtr0sGptAX/xIcYUrhmINaRR4pN3Qm6Y4SjU=;
        b=RDsZD1Zh+Tw0YbspAIBRP8+2lxuzFGsxZOc4VzxPVBzrdb2Hb3/wrGmxdHq1HM3Muz
         MlcGi0TGJb1dEbJK9oh6XNGTC9ftpuWEo1gJcPj4OBFILU41w1BfNsR2pGmEs62fYy0l
         vDXcelQmXSSS/YmQfF/fPu9DCAeAlJO3ciklk3d645uJLscRiO8HNssjPwA6ZFjNZ+f1
         U6Pqx7QnkKI9pqjcGl2C0HAFHy/jFnx19tYCELdRhL8NNALbCRLznRrH+LbZ6DUpIFhU
         eA4WwvP5Wa056ou199jq8GVc2ReU0IBqQ3kHMCz/roEoEk2PEpTbYIkpuP/7oSfAFpW6
         3d7A==
X-Forwarded-Encrypted: i=1; AKwUvByER2i0DAvb/FasK1YaVmAsKjAxZXs8uPXFbBOZPFFKcV7fJZxe4lJ6IN8886PIo9t1d84nMrwraRDVWap8rw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLnn5xV4qK51V2qiJ8U2bG72AXN+RR0LdMM+HUR0jI/mq8AxfrR
	DXmXe42eXuJmQJHl7bxRKKap+W9wjA9rfv6gv0MX4j7ZKCTMcBGKpXWloqlGKXqLl4bI7UZuWAr
	V2Z/fGUxp96hJE4MAp1rQB7/RDxTB2O0=
X-Gm-Gg: AYBFou0iqwWrJEg4NjwkCUssPyRXxSLPtm2wuc8eJh7cDduFcDAk/jXgAky03NpJwLx
	5j8kwu84ITo0ib9S6KYQNXWh3srcgEZjUuxug2mHKFRayyV+J8Fz7EFcX4jP2d+ODnhuSCBX952
	XlIWRRIp0QQtv8r6iEtpKkA+C9JZi6kMhS1rNTGbKWs4yesqoXcXHIQIeiX+wuV+iM26MWniMeD
	+ZXz3ogB+3PPPpu3PMYuZLCg99Bc8EoaX8qBfj3fPTgqN0EOaBU7E9aFfTyy+cB7WKyqtq+A2uw
	DtbcAFnat8vyVSc9rnAKoyXw+wSk7pHHB/CMsBQyxVL+05OnPxHscYBHf48ZDLqGWGxXuflEMHh
	GZqijNOTTaAAEwxTC15cg5xE0L0z3QhiqPJNw95zjaNhzyMr3RXCzcvKKPPEpRnSyessXgspKa4
	0Me5pA1iwbuQA8iTqAIfpfN98TxrKV8PCNSpoCkfz3XrvUidly8Qs=
X-Received: by 2002:a05:7300:8a9a:b0:35f:8c5d:5938 with SMTP id
 5a478bee46e88-35f8c5d5b04mr947891eec.1.1792046497624; Wed, 14 Oct 2026
 23:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 08:41:24 +0200
X-Gm-Features: AclHuK_HDQ14xS71Ad82_rpzYIJtkQyGIN6gdAVSfUGhxccboCyKadyvvVMRcI0
Message-ID: <CANiq72mu5nS89cxFQ8c8k+URcqfSCGLJ0d8xW3k0Gp-fMeVWLQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
>         [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Happy to pick it up if workqueue is OK with it.

Cheers,
Miguel
