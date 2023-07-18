Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E916403
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jul 2023 18:05:39 +0000 (UTC)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746991B5
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jul 2023 11:05:38 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1ba79f16f4cso2391432fac.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jul 2023 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689703537; x=1692295537;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jblbDQ6dnZ3qPUjRxhJmdJHrPEWm22ceBzAF/P1QLmk=;
        b=TIuIO2vzzN23mP9V6A4j4ocFs+qUXR5GGk6/zN30BHb+azbJAPY2uiT453EFE30oI8
         O3FFui/RbVjwW3tmwdSQK95Xkyz1zwXt1bfvUKYnfKmpqwB98pHw1r1blYIUCeY91qYH
         izfW+yWHV7b7I3X9nWZQEqKb6LLL4MFMYEOjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689703537; x=1692295537;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jblbDQ6dnZ3qPUjRxhJmdJHrPEWm22ceBzAF/P1QLmk=;
        b=jLq9BFvKa13MVmax4SZFqZ+La3qblc53vl8J0UUSErzX6qu5f6iF5Rjj7gsGiL8pj8
         5OJiCHDNWY3Ro19rInBI7Z9oz4efPVf/3Ht7a/hntZ34UevOoeGzOANpEV+37ubLQT0I
         fTkdgvGR7FOkK+CLqhN3RwgTRhokBE3YFJO36l1LAUMvq0MS54x9KhKHhqqby3DCkNYX
         p3PKASg5QcrvtgJLvEmoARiwiXsxKA+np9UMbTEstjqMiJhJ6wtlZDLlVI1BlvfFq50u
         S/ZpjnN2HPlVoE+QIitvMpJnIOKRbg6xb+EdIt8OWAzrNauCr4tZTJpzq+yrcNg8cg59
         3pBg==
X-Gm-Message-State: ABy/qLalolkrW9Do/KEat82FjnH91OE1HIbRWaCBwo1FVMdvWz2RqvWh
	eFGbGuXbPJWoaqK+xYurd08ei6TzqGZUfPjU74E=
X-Google-Smtp-Source: APBJJlG8IIXofVgaj5i3t4XzYKfTP4xA9i4+yGrS2G7pHeEsUvvgFO+ZFekMOk9zpTvxelYLVCXWdA==
X-Received: by 2002:a05:6870:65a7:b0:19a:34ed:db04 with SMTP id fp39-20020a05687065a700b0019a34eddb04mr16515857oab.32.1689703537572;
        Tue, 18 Jul 2023 11:05:37 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id i4-20020a0cf484000000b006322ce05eb4sm883227qvm.100.2023.07.18.11.05.37
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 11:05:37 -0700 (PDT)
Date: Tue, 18 Jul 2023 14:05:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: rust-for-linux@vger.kernel.org
Subject: Test delivery and archive propagation
Message-ID: <20230718-refinance-levitator-cf0be1@meerkat>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello:

This list has been migrated to its new location on the LF "subspace" system.
There is no action required on your part -- it should be a fully transparent
migration.

This message serves as a propagation test to make sure that the archives are
properly replicating.

Best regards,
-K
