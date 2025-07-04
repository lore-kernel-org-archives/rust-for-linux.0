Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BBB3249CF
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Jul 2025 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615820; cv=none; b=bcSbXfbfitbvED69wQMHLpUqSHbeTJbn3OGVNSLr10R7wrADS4b7LVrZ0Elnv17WnDzopcgnVMdnnd4U2DtU/qfE6O65zGUOzbqjrMJteAOdPED0GbPxqemF2NTNXcFuu5WSTRSReqcK2WSyDc42dphvqg8/KcrOPoHtuUAkz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615820; c=relaxed/simple;
	bh=179YXc8mtwTm8NT1M6bNKZhG6xJYF/YK1toqXrlXQ88=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r1hokbntKhrEOAjdlNTG79DcBxUIQDr3ly3Di79rk48PTOGkyoRN7WTXNeLOZw62eH61Ao/YzHxXRrvUvk5kKSOZM4TqawxIwsKjwVgGr/VIB05bNcou9iJngpl27Rr1elXho8b+vR6wPBKuFBjlW2tk9xMc+nY2X/Vxr1oKHPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zt3UpnoC; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zt3UpnoC"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a1701so491183a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Jul 2025 00:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751615817; x=1752220617; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALgZHWa9pYUqmbNq0h7cIZ3SkH5GeLmbxoaZlCxVUj4=;
        b=Zt3UpnoCMn+yI74CTi9UH8tJpy72TaUrsD7DtF5aN+ruUNqNB3WRmVfykugnFVmFr6
         3YfOc9mEecGajZ8anIVRsW2jQpbIIxHT1rqCeQlN5+go5OUHXEyPEv1oBP6lSsyvb59C
         Lfcw4ts9j+Qcw7TTUipBvEnxg8aGLyZLwfmFJBHwbcnqr7j8M4T1HnEIoClTZTtAdfKM
         QfjA0eUKymVh+aiQKeGr5TeDpZ9l81dN3CDIlz5zBLQhYp7ZfE5RZkeKXwdWsxjj5bGu
         tB4zrQrsUsvkbM0lwiLwKDKQH7aPTx0ZaANDlhBsX9wQxO34iJ7o6rSi/8YII7UXQpif
         S8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751615817; x=1752220617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALgZHWa9pYUqmbNq0h7cIZ3SkH5GeLmbxoaZlCxVUj4=;
        b=q9YWWvT2J4hmGeAyOwW8mh8dSMZE4HPBXFYkU+pI/OtFW0QvrPNO/P0N1BXjE6eZXW
         tgdZJqumE1fPTrhP975gqEN/kmjpRGTVPgsI8IZP3vPGBCCTUBVvAMOX+ta1l/u2ABoR
         XLMrFXkrgsusMERqkYyEAgWyrEJwfLwKQddP7Jb2acYdOXn5Wb/joBWASckxgKs3VvPf
         gVzuSbyAinEMwGOGrUx9uVAXc154OmvDTeb5gOBS2LMUSHmQPJlqmwO+fLpjfvsFfUmC
         UcDVq/XqWGAqm46tymkQHj0Ixt1SFCqK7a5w1n0cmvRMOszRlBXa6wH6QkpYdlCuME1Z
         +bfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmngTMi1FD15byCt+YLM4Lb8NmEpq+qdqp6VaMr/eGok+Fs1mHi6rH4SW7Y9odAQ3JJLXQ9qvTY1Vans15Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFwGxTwJnHAR1sfaXJlBW1HyJyxq/He0JwM7514kPTfNhsRjwD
	JYompASzJQhtfRPq6Nupe1xuEw7Nz4/h6NLFBTo14h3EURJoFoZ0Qi1UOVGbCb38oa3OqIkwZA9
	GA0g81aB8gn4EvyfBVA==
X-Google-Smtp-Source: AGHT+IFktxIwyvZwcQd0biV2vBnce6PsUlb2ZC1baiUOba9veiiFknWjdWLdFK+HwGIdc6aVeEoOzA3Bt94BqBw=
X-Received: from edj3.prod.google.com ([2002:a05:6402:3243:b0:609:adbf:eb1a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:34d5:b0:608:6501:6a1f with SMTP id 4fb4d7f45d1cf-60fd2f854e6mr1088579a12.1.1751615817119;
 Fri, 04 Jul 2025 00:56:57 -0700 (PDT)
Date: Fri, 4 Jul 2025 07:56:56 +0000
In-Reply-To: <20250703-topics-tyr-request_irq-v6-6-74103bdc7c52@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250703-topics-tyr-request_irq-v6-0-74103bdc7c52@collabora.com> <20250703-topics-tyr-request_irq-v6-6-74103bdc7c52@collabora.com>
Message-ID: <aGeJSElRKa5sNGbc@google.com>
Subject: Re: [PATCH v6 6/6] rust: pci: add irq accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 03, 2025 at 04:30:04PM -0300, Daniel Almeida wrote:
> These accessors can be used to retrieve a irq::Registration or a
> irq::ThreadedRegistration from a pci device. Alternatively, drivers can
> retrieve an IrqRequest from a bound PCI device for later use.
> 
> These accessors ensure that only valid IRQ lines can ever be registered.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Same question as patch 5. With that answered:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
