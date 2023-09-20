Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292A91A5A2
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Sep 2023 18:05:44 +0000 (UTC)
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a01:4f8:c012:b874::])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EA6C9;
	Wed, 20 Sep 2023 11:05:43 -0700 (PDT)
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1695233141; bh=aelmzdlktMzG97R1JnkYq1JCbq8afJEne6diWnvrLbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wfca2MTUJ2AwZDltSv0Rqk//Ug0RJ8Rv1IMxyEdGQItJ8KwGt493Sf18OuNEC0/KW
	 xMgnE2LKz9j31WZTkgxgCa9vjhvbwyqyzjuU0RRxGDeC0aegBe2YmHgRORYqQehSzR
	 9CDoO5JyYlx5XZGgY/mJBq4045yZqxegA8s+pM1Q=
To: Manmohan Shukla <manmshuk@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: error: Markdown style nit
Date: Wed, 20 Sep 2023 20:05:40 +0200
Message-ID: <27211D21-4A09-48B0-B51F-1C353BEDC784@kloenk.dev>
In-Reply-To: <20230906204857.85619-1-manmshuk@gmail.com>
References: <20230906204857.85619-1-manmshuk@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 6 Sep 2023, at 22:48, Manmohan Shukla wrote:

> This patch fixes a trivial markdown style nit in the `SAFETY` comment.
>
> Signed-off-by: Manmohan Shukla <manmshuk@gmail.com>
> ---

Reviewed-by: Finn Behrens <me@kloenk.dev>
